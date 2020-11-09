DATA_ROOT=/home/meng72/mr/data/kitti/depth/
TRAIN_SET=$DATA_ROOT/kitti_256/
MODEL=vgg_bn
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

MODEL=dispnet
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

MODEL=vgg
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

MODEL=disp_res
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

MODEL=disp_res_101
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

MODEL=disp_res_18
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

MODEL=disp_res_50
python3 train-models-su.py $TRAIN_SET \
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
--model $MODEL \
--name final-v2-$MODEL-train-su

