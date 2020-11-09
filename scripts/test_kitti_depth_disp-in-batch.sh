#!/bin/bash
DATA_ROOT=/home/meng72/mr/data/kitti/depth/kitti_depth_test
RESULTS_DIR=/home/meng72/mr/SC-SfMLearner-Release/results/kitti_depth_test

DISP_ROOT=checkpoints/
DISP_NET=DISP_ROOT

model="resnext-depth"
displist=( "final-v2-"$model"-train" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done

if [ 0 -eq 1 ]; then
model=dispnets
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done


model=disp_res_101
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done


model=disp_res_50
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done


model=disp_res_18
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done


model=disp_res
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done


model=disp_vgg_bn
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done


model=disp_vgg_feature
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    #if [ 0 -eq 1 ]; then
    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth > results-$i.txt
    #fi

done
fi
