#!/bin/bash
DATA_ROOT=/content/nyu_depth_test
RESULTS_DIR=/content/SC-SfMLearner-supervised-depth/results/nyu_depth_test

DISP_ROOT=checkpoints/
DISP_NET=DISP_ROOT

resnetlayer=18
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    printf "\n\n-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp.py --resnet-layers $resnetlayer --img-height 256 --img-width 832 \
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-nyu-$i.txt
    #fi

done


