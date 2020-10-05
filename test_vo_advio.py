import torch

from imageio import imread, imsave
from skimage.transform import resize as imresize
import numpy as np
from path import Path
import argparse
from tqdm import tqdm

from inverse_warp import pose_vec2mat
from scipy.ndimage.interpolation import zoom

from inverse_warp import *

import models
from utils import tensor2array

import cv2

parser = argparse.ArgumentParser(description='Script for visualizing depth map and masks',
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("--pretrained-posenet", required=True, type=str, help="pretrained PoseNet path")
parser.add_argument("--img-height", default=256, type=int, help="Image height")
parser.add_argument("--img-width", default=832, type=int, help="Image width")
parser.add_argument("--no-resize", action='store_true', help="no resizing is done")

parser.add_argument("--dataset-dir", type=str, help="Dataset directory")
parser.add_argument("--output-dir", type=str, help="Output directory for saving predictions in a big 3D numpy file")
parser.add_argument("--img-exts", default=['png', 'jpg', 'bmp'], nargs='*', type=str, help="images extensions to glob")
parser.add_argument("--rotation-mode", default='euler', choices=['euler', 'quat'], type=str)

parser.add_argument("--sequence", default='09', type=str, help="sequence to test")
device = torch.device("cuda") if torch.cuda.is_available() else torch.device("cpu")


def load_tensor_image(filename, args):
    img = imread(filename).astype(np.float32)
    h, w, _ = img.shape
    if (not args.no_resize) and (h != args.img_height or w != args.img_width):
        img = imresize(img, (args.img_height, args.img_width)).astype(np.float32)
    img = np.transpose(img, (2, 0, 1))
    tensor_img = ((torch.from_numpy(img).unsqueeze(0)/255-0.45)/0.225).to(device)
    return tensor_img


@torch.no_grad()
def main():
    args = parser.parse_args()

    weights_pose = torch.load(args.pretrained_posenet)
    pose_net = models.PoseResNet().to(device)
    pose_net.load_state_dict(weights_pose['state_dict'], strict=False)
    pose_net.eval()

    image_dir = Path(args.dataset_dir)
    output_dir = Path(args.output_dir)
    output_dir.makedirs_p()

    test_files = sum([image_dir.files('*.{}'.format(ext)) for ext in args.img_exts], [])
    test_files.sort()

    print('{} files to test'.format(len(test_files)))
    #print(test_files)

    global_pose = np.eye(4)
    if 'advio-04' in args.dataset_dir:
        global_pose = np.array([[0.2337503561460601, 0.71124984004749991, -0.66293618387207998, 0.0037387620000000001], [0.10487759004941999, 0.65940272844750003, 0.74443851971943986, 0.082704390000000003], [0.96662371684119996, -0.24353990138999998, 0.079541459813400106, -0.023607989999999999], [0.0, 0.0, 0.0, 1.0]]) # advio-04
    elif 'advio-23' in args.dataset_dir:
        global_pose = np.array([[-0.02024017794777988, -0.7758527702428, 0.630589204478, -0.005759389], [0.11342629147720007, 0.62486446287, 0.7724499038534, -0.09049783], [-0.993340194646, 0.08715994761339996, 0.0753547505262201, -0.001374606], [0.0, 0.0, 0.0, 1.0]]) # advio-23
    print(str(global_pose))
    poses = [global_pose[0:3, :].reshape(1, 12)]

    n = len(test_files)
    tensor_img1 = load_tensor_image(test_files[0], args)

    for iter in tqdm(range(n - 1)):

        tensor_img2 = load_tensor_image(test_files[iter+1], args)

        pose = pose_net(tensor_img1, tensor_img2)

        pose_mat = pose_vec2mat(pose).squeeze(0).cpu().numpy()
        pose_mat = np.vstack([pose_mat, np.array([0, 0, 0, 1])])
        global_pose = global_pose @  np.linalg.inv(pose_mat)

        poses.append(global_pose[0:3, :].reshape(1, 12))

        # update
        tensor_img1 = tensor_img2

    poses = np.concatenate(poses, axis=0)
    filename = Path(args.output_dir + args.sequence + ".txt")
    np.savetxt(filename, poses, delimiter=' ', fmt='%1.8e')


if __name__ == '__main__':
    main()
