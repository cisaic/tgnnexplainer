# source /sw/arch/RHEL8/EB_production/2023/software/Anaconda3/2023.07-2/etc/profile.d/conda.sh
# conda activate condafact

# call this script with `bash run_explainers_model_dataset.sh 0 tgat wikipedia 2020` to on the first GPU with dataset wikipedia with seed 2020

# bash run_explainers_model_dataset.sh 1 tgat wikipedia 1  2>&1 | tee logs/tgat-wikipedia-gpu1-seed1.log # to write to a log file

# run all explainers
# model = tgn, tgat
# dataset = wikipedia # wikipedia, reddit, simulate_v1, simulate_v2, mooc

gpu=$1
model=$2
dataset=$3
seed=$4

# bash run_explainers_model_dataset_l1-10-100.sh 0 tgn wikipedia 2  2>&1 | tee logs/tgn-wikipedia-gpu0-seed2-l1-10-100.log

echo "run on GPU ${gpu} on dataset ${dataset} model ${model} with seed ${seed}"
echo "=== subgraph explainer ONLY ==="
echo "=== RUNNING c_puct 1,10,100 ==="

printf "%s " "Press enter to continue"
read ans

#Necessary to train first
# ours
echo "=== STARTING subgraphx explaining on ${model} trained on ${dataset} on GPU ${gpu} with seed ${seed}==="
python subgraphx_tg_run.py  datasets=${dataset} device_id=${gpu} explainers=subgraphx_tg models=${model} seed=${seed} explainers.param.${dataset}.c_puct=1
python subgraphx_tg_run.py  datasets=${dataset} device_id=${gpu} explainers=subgraphx_tg models=${model} seed=${seed} explainers.param.${dataset}.c_puct=10
python subgraphx_tg_run.py  datasets=${dataset} device_id=${gpu} explainers=subgraphx_tg models=${model} seed=${seed} explainers.param.${dataset}.c_puct=100
echo "=== ENDING subgraphx_tg explaining on ${model} trained on ${dataset} on GPU ${gpu} with seed ${seed}==="


echo "good job :)"

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'fgolemo@gmail.com' --mail-rcpt 'fgolemo@gmail.com' --mail-rcpt 'c.isaicu@gmail.com' --user 'fgolemo@gmail.com:cbpd uyvw pzqg fppq' -T <(echo -e "From: fgolemo@gmail.com\nTo: fgolemo@gmail.com,c.isaicu@gmail.com\nSubject: Training Done\n\nFinished ${model} lambd 1, 10, 100 subgraph explanation of ==${dataset}== with seed ==${seed}== on on GPU ==${gpu}==")

