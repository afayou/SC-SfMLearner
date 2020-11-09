#!/bin/bash
DATA_ROOT=/content/depth/kitti_depth_test
RESULTS_DIR=/content/SC-SfMLearner-supervised-depth/results/kitti_depth_test

DISP_ROOT=checkpoints/
DISP_NET=DISP_ROOT


model=dispnet
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done

model="vgg"
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done


model="vgg_bn"
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

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
    --gt_depth=$DATA_ROOT/depth 
    #fi

done



resnetlayer=18
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp.py --resnet-layers $resnetlayer --img-height 256 --img-width 832 \
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done

resnetlayer=34
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp.py --resnet-layers $resnetlayer --img-height 256 --img-width 832 \
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done


resnetlayer=50
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp.py --resnet-layers $resnetlayer --img-height 256 --img-width 832 \
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done

resnetlayer=101
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp.py --resnet-layers $resnetlayer --img-height 256 --img-width 832 \
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done


resnetlayer=152
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp.py --resnet-layers $resnetlayer --img-height 256 --img-width 832 \
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done


model="resnext-depth"
displist=( "final-v2-"$model"-train" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    # test
    python3 test_disp_models.py --resnet-layers 18 --img-height 256 --img-width 832 \
    --dataset kitti --model $model\
    --pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT/color \
    --output-dir $RESULTS_DIR

    # evaluate
    python3 eval_depth.py \
    --dataset kitti \
    --pred_depth=$RESULTS_DIR/predictions.npy \
    --gt_depth=$DATA_ROOT/depth 

done


