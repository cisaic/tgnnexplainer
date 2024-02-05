source /sw/arch/RHEL8/EB_production/2023/software/Anaconda3/2023.07-2/etc/profile.d/conda.sh
conda activate condafact
for i in 0, 1, 2
do
    echo "${i}-th run\n"

    dataset=reddit_hyperlinks
    python learn_edge.py -d ${dataset} --bs 512 --n_degree 10 --n_epoch 10 --agg_method attn --attn_mode prod --gpu 1 --time_dim 92 --node_dim 92  --n_head 2 --prefix ${dataset}

done
