# dataset: wikipedia, reddit, simulate_v1, simulate_v2
source /sw/arch/RHEL8/EB_production/2023/software/Anaconda3/2023.07-2/etc/profile.d/conda.sh
conda activate condafact
for i in 0 1 2
do
    echo "${i}-th run\n"

    dataset=mooc
    python train_self_supervised.py -d ${dataset} --prefix tgn-attn --n_runs 1 --n_epoch 10 --n_layer 2 --n_degree 10 --use_memory --node_dim 4 --time_dim 4 --message_dim 4 --memory_update_at_end --gpu 0 \
    --memory_dim 88 # memory_dim should equal to node/edge feature di
    
    dataset=reddit_hyperlinks
    python train_self_supervised.py -d ${dataset} --prefix tgn-attn --n_runs 1 --n_epoch 10 --n_layer 2 --n_degree 10 --use_memory --node_dim 88 --time_dim 88 --message_dim 88 --memory_update_at_end --gpu 0 \
    --memory_dim 4 # memory_dim should equal to node/edge feature di

done

