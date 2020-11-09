#!/bin/bash
DATA_ROOT=/home/meng72/mr/data/kitti/depth/kitti_depth_test
RESULTS_DIR=/home/meng72/mr/SC-SfMLearner-Release/results/kitti_depth_test

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
    
    echo "rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar"
    echo "rm $DISP_ROOT/$i/$dispname/e*"
    echo "rm $DISP_ROOT/$i/$dispname/p*"
    echo "rm -rf $DISP_ROOT/$i/$dispname/valid"

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid
done

model="vgg"
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid

done


model="vgg_bn"
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid

done

model=disp_res_18
displist=( "final-v2-"$model"-train" "final-v2-"$model"-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid

done



resnetlayer=18
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid
done

resnetlayer=34
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid
done


resnetlayer=50
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid
done

resnetlayer=101
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid
done


resnetlayer=152
displist=( "final-v2-resnet"$resnetlayer"_depth_256-train" "final-v2-resnet"$resnetlayer"_depth_256-train-su" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid
done


model="resnext-depth"
displist=( "final-v2-"$model"-train" )

for i in "${displist[@]}"
do
    echo "-------- "$i
    dispname=$(ls $DISP_ROOT/$i)
    DISP_NET=$(echo $DISP_ROOT/$i/$dispname/dispnet_model_best.pth.tar)
    echo $DISP_NET

    rm $DISP_ROOT/$i/$dispname/dispnet_checkpoint.pth.tar
    rm $DISP_ROOT/$i/$dispname/e*
    rm $DISP_ROOT/$i/$dispname/p*
    rm -rf $DISP_ROOT/$i/$dispname/valid

done

