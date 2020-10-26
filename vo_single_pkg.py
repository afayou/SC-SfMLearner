import torch

from imageio import imread, imsave
from skimage.transform import resize as imresize
import numpy as np
from path import Path
import argparse
#from tqdm import tqdm

from .inverse_warp import pose_vec2mat
from scipy.ndimage.interpolation import zoom

from .inverse_warp import *

def load_tensor_image(filename, args, device):
    img = imread(filename).astype(np.float32)
    h, w, _ = img.shape
    if (not args.no_resize) and (h != args.img_height or w != args.img_width):
        img = imresize(img, (args.img_height, args.img_width)).astype(np.float32)
    img = np.transpose(img, (2, 0, 1))
    tensor_img = ((torch.from_numpy(img).unsqueeze(0)/255-0.45)/0.225).to(device)
    return tensor_img

@torch.no_grad()
def estimate_pose(pose_net, img_files, args, device,\
    global_pose = np.eye(4)):

    tensor_img1 = load_tensor_image(img_files[0], args, device)
    tensor_img2 = load_tensor_image(img_files[1], args, device)
    pose = pose_net(tensor_img1, tensor_img2)

    pose_mat = pose_vec2mat(pose).squeeze(0).cpu().numpy()
    pose_mat = np.vstack([pose_mat, np.array([0, 0, 0, 1])])
    global_pose = global_pose @  np.linalg.inv(pose_mat)

    print(global_pose[0:3, :].reshape(1, 12))
    return global_pose[0:3, :].reshape(1, 12)
