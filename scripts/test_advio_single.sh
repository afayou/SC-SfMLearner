#DATASET_DIR=/home/meng72/mr/data/advio/advio-04/iphone/frames-rn/
#DATASET_DIR=/home/meng72/mr/data/advio/advio-23/iphone/frames-rn/
DATASET_DIR=/home/meng72/mr/data/advio/advio-04/iphone/frames-rn-256x832/
OUTPUT_DIR=vo_results/

POSE_NET=checkpoints/resnet50_pose_256/exp_pose_model_best.pth.tar

python3 test_vo_advio_single.py \
--img-height 832 --img-width 256 \
--sequence advio-04 \
--pretrained-posenet $POSE_NET \
--tensor-img-1  /home/meng72/mr/data/advio/advio-04/iphone/frames-rn-256x832/000000.png \
--tensor-img-2  /home/meng72/mr/data/advio/advio-04/iphone/frames-rn-256x832/000001.png \
--output-dir $OUTPUT_DIR

#python3 ./kitti_eval/eval_odom.py --result=$OUTPUT_DIR --align='7dof'
