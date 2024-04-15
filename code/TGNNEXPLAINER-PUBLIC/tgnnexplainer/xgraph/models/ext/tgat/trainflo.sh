# i mean not literally

# call this script with `bash trainflo.sh 0 0` to run the first seed on the first GPU

# ! IMPORTANT: I've removed the ` --node_dim 172 --time_dim 172` parameters because that sets them to the default of 100
# for all datasets, which makes more sense than adjusting them, I think. They're just embedding sizes, so they're 
# independent of the number of columns in the data.

gpu=$1
seed=$2

echo "seed ${seed} run on GPU ${gpu}"

printf "%s " "Press enter to continue"
read ans

echo "=== STARTING WITH REDDIT ==="

python learn_edge.py -d reddit --bs 512 --n_degree 10 --n_epoch 10 --agg_method attn --attn_mode prod --gpu ${gpu} --n_head 2 --prefix reddit --seed ${seed}

echo "=== DONE WITH REDDIT, NOW WIKIPEDIA ==="

python learn_edge.py -d wikipedia --bs 512 --n_degree 10 --n_epoch 10 --agg_method attn --attn_mode prod --gpu ${gpu} --n_head 2 --prefix wikipedia --seed ${seed}

echo "=== DONE WITH WIKIPEDIA, NOW MOOC ==="

python learn_edge.py -d mooc --bs 512 --n_degree 10 --n_epoch 10 --agg_method attn --attn_mode prod --gpu ${gpu} --n_head 2 --prefix mooc --seed ${seed}

echo "=== DONE WITH MOOC, NOW REDDIT HYPERLINKS ==="

python learn_edge.py -d reddit_hyperlinks --bs 512 --n_degree 10 --n_epoch 10 --agg_method attn --attn_mode prod --gpu ${gpu} --n_head 2 --prefix reddit_hyperlinks --seed ${seed}

echo "=== DONE REDDIT HYPERLINKS on seed ${seed} on GPU ${gpu} ==="
echo "good job :)"
