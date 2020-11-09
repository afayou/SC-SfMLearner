DATA_ROOT=/home/meng72/mr/data/kitti/depth/
TRAIN_SET=$DATA_ROOT/kitti_256/
python3 train-su.py $TRAIN_SET \
--resnet-layers 101 \
--num-scales 1 \
-b1 -s0.1 -c0.5 --epoch-size 400 --sequence-length 3 \
--epochs 40 \
--with-ssim 1 \
--with-mask 1 \
--with-auto-mask 1 \
--with-pretrain 1 \
--log-output --with-gt \
--pretrained-pose /home/meng72/mr/SC-SfMLearner-Release/checkpoints/resnet18_depth_256/exp_pose_model_best.pth.tar \
--name final-v2-resnet101_depth_256-train-su

python3 train-su.py $TRAIN_SET \
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
--name final-v2-resnet152_depth_256-train-su

python3 train-su.py $TRAIN_SET \
--resnet-layers 18 \
--num-scales 1 \
-b1 -s0.1 -c0.5 --epoch-size 400 --sequence-length 3 \
--epochs 40 \
--with-ssim 1 \
--with-mask 1 \
--with-auto-mask 1 \
--with-pretrain 1 \
--log-output --with-gt \
--pretrained-pose /home/meng72/mr/SC-SfMLearner-Release/checkpoints/resnet18_depth_256/exp_pose_model_best.pth.tar \
--name final-v2-resnet18_depth_256-train-su

python3 train-su.py $TRAIN_SET \
--resnet-layers 34 \
--num-scales 1 \
-b1 -s0.1 -c0.5 --epoch-size 400 --sequence-length 3 \
--epochs 40 \
--with-ssim 1 \
--with-mask 1 \
--with-auto-mask 1 \
--with-pretrain 1 \
--log-output --with-gt \
--pretrained-pose /home/meng72/mr/SC-SfMLearner-Release/checkpoints/resnet18_depth_256/exp_pose_model_best.pth.tar \
--name final-v2-resnet34_depth_256-train-su

python3 train-su.py $TRAIN_SET \
--resnet-layers 50 \
--num-scales 1 \
-b1 -s0.1 -c0.5 --epoch-size 400 --sequence-length 3 \
--epochs 40 \
--with-ssim 1 \
--with-mask 1 \
--with-auto-mask 1 \
--with-pretrain 1 \
--log-output --with-gt \
--pretrained-pose /home/meng72/mr/SC-SfMLearner-Release/checkpoints/resnet18_depth_256/exp_pose_model_best.pth.tar \
--name final-v2-resnet50_depth_256-train-su
