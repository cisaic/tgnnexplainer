model=tgat
dataset=reddit_hyperlinks
epoch=9

source_path=./saved_checkpoints/${dataset}-attn-prod-${epoch}.pth
target_path=~/FACT-course/code/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/models/checkpoints/${model}_${dataset}_best.pth
cp ${source_path} ${target_path}

echo ${source_path} ${target_path} 'copied'


ls -l home/scur1016/FACT-course/code/TGNNEXPLAINER-PUBLIC/xgraph/models/checkpoints
