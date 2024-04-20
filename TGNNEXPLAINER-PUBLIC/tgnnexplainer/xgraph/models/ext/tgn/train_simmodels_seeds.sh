# call this script with `bash train_simmodels_seeds.sh 0` to run all seeds on the first GPU with both simulated datasets (TGN model)


gpu=$1

printf "%s " "Press enter to continue"
read ans

for seed in 1 2 2020
do
    echo "=== STARTING TGN model training of simulate_v1 on seed ${seed} on GPU ${gpu} ==="
    python train_simulate.py -d simulate_v1 --prefix tgn-attn --n_runs 1 --n_epoch 100 --n_layer 2 --node_dim 4 --time_dim 4 --memory_dim 4 --message_dim 4 --n_degree 10 --use_memory --memory_update_at_end --gpu ${gpu} --seed ${seed}
    echo "=== DONE TGN model training of simulate_v1 on seed ${seed} on GPU ${gpu} ==="

    echo "=== STARTING TGN model training of simulate_v2 on seed ${seed} on GPU ${gpu} ==="
    python train_simulate.py -d simulate_v2 --prefix tgn-attn --n_runs 1 --n_epoch 100 --n_layer 2 --node_dim 4 --time_dim 4 --memory_dim 4 --message_dim 4 --n_degree 10 --use_memory --memory_update_at_end --gpu ${gpu} --seed ${seed}
    echo "=== DONE TGN model training of simulate_v2 on seed ${seed} on GPU ${gpu} ==="
done


echo "good job :)"

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'fgolemo@gmail.com' --mail-rcpt 'fgolemo@gmail.com' --mail-rcpt 'c.isaicu@gmail.com' --user 'fgolemo@gmail.com:cbpd uyvw pzqg fppq' -T <(echo -e "From: fgolemo@gmail.com\nTo: fgolemo@gmail.com,c.isaicu@gmail.com\nSubject: Training Done\n\nFinished TGN model training of both sim datasets on all seeds on GPU ==${gpu}==")


















