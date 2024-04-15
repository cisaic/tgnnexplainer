# dataset: wikipedia, reddit, simulate_v1, simulate_v2
source /sw/arch/RHEL8/EB_production/2023/software/Anaconda3/2023.07-2/etc/profile.d/conda.sh
conda activate condafact
for i in 0 1 2
do
    echo "${i}-th run\n"

    dataset=reddit
    python train_self_supervised.py -d ${dataset} --prefix tgn-attn --n_runs 1 --n_epoch 10 --n_layer 2 --n_degree 10 --use_memory --gpu 0

done

