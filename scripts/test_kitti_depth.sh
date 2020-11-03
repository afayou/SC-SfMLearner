DISP_NET=checkpoints/resnet18_depth_256/dispnet_model_best.pth.tar
DISP_NET=checkpoints/resnet18_depth_256-train-su/11-02-22\:32-add0-epoch60/dispnet_model_best.pth.tar
DISP_NET=checkpoints/resnet18_depth_256-train/11-02-15\:24/dispnet_checkpoint.pth.tar
DISP_NET=checkpoints/resnet18_depth_256-train-su/11-02-20\:26-add0/dispnet_checkpoint.pth.tar
# DISP_NET=checkpoints/resnet50_depth_256/dispnet_model_best.pth.tar

DATA_ROOT=/home/meng72/mr/data/kitti/depth/kitti_depth_test
RESULTS_DIR=/home/meng72/mr/SC-SfMLearner-Release/results/kitti_depth_test

# test
python3 test_disp.py --resnet-layers 18 --img-height 256 --img-width 832 \
--pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
--output-dir $RESULTS_DIR

# evaluate
python3 eval_depth.py \
--dataset kitti \
--pred_depth=$RESULTS_DIR/predictions.npy \
--gt_depth=$DATA_ROOT/depth
