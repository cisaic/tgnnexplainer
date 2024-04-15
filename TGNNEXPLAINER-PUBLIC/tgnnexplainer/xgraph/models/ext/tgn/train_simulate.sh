# dataset: wikipedia, reddit, simulate_v1, simulate_v2
source /sw/arch/RHEL8/EB_production/2023/software/Anaconda3/2023.07-2/etc/profile.d/conda.sh
conda activate condafact
for i in 0 1 2
do
    echo "${i}-th run\n"

    dataset=simulate_v1
    python train_simulate.py -d ${dataset} --prefix tgn-attn --n_runs 1 --n_epoch 100 --n_layer 2 --node_dim 4 --time_dim 4 --memory_dim 4 --message_dim 4 --n_degree 10 --use_memory --memory_update_at_end --gpu 0

    dataset=simulate_v2
    python train_simulate.py -d ${dataset} --prefix tgn-attn --n_runs 1 --n_epoch 100 --n_layer 2 --node_dim 4 --time_dim 4 --memory_dim 4 --message_dim 4 --n_degree 10 --use_memory --memory_update_at_end --gpu 0

done












