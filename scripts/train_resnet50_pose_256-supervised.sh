DATA_ROOT=/home/meng72/mr/data/kitti/odom/
TRAIN_SET=$DATA_ROOT/kitti_vo_256/
python3 train-su.py $TRAIN_SET \
--resnet-layers 50 \
--num-scales 1 \
-b4 -s0.1 -c0.5 --epoch-size 1000 --sequence-length 3 \
--epochs 2 \
--with-ssim 1 \
--with-mask 1 \
--with-auto-mask 1 \
--with-pretrain 1 \
--log-output \
--name resnet50_pose_256-train-su
