DATA_ROOT=/home/meng72/mr/data/kitti/depth/
TRAIN_SET=$DATA_ROOT/kitti_256/
python3 train.py $TRAIN_SET \
--resnet-layers 152 \
--num-scales 1 \
-b1 -s0.1 -c0.5 --epoch-size 400 --sequence-length 3 \
--epochs 40 \
--with-ssim 1 \
--with-mask 1 \
--with-auto-mask 1 \
--with-pretrain 1 \
--log-output --with-gt \
--pretrained-pose /home/meng72/mr/SC-SfMLearner-Release/checkpoints/resnet18_depth_256/exp_pose_model_best.pth.tar \
--name resnet152_depth_256-train
