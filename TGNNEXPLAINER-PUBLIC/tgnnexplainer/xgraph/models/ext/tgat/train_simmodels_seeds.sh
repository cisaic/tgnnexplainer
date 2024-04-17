# i mean not literally

# call this script with `bash train_simmodels_seeds.sh 0`


gpu=$1


echo "run on GPU ${gpu} on dataset ${ds}"

printf "%s " "Press enter to continue"
read ans

for seed in 1 2 2020
do
    echo "=== STARTING TGAT model training of ${ds} on seed ${seed} on GPU ${gpu} ==="
    python learn_simulate.py -d simulate_v1 --bs 256 --n_degree 10 --n_epoch 100 --agg_method attn --attn_mode prod --node_dim 4 --time_dim 4 --gpu ${gpu} --n_head 2 --prefix simulate_v1 --seed ${seed}
    python learn_simulate.py -d simulate_v2 --bs 256 --n_degree 10 --n_epoch 100 --agg_method attn --attn_mode prod --node_dim 4 --time_dim 4 --gpu ${gpu} --n_head 2 --prefix simulate_v2 --seed ${seed}
    echo "=== DONE TGAT model training of ${ds} on seed ${seed} on GPU ${gpu} ==="
done


echo "good job :)"

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'fgolemo@gmail.com' --mail-rcpt 'fgolemo@gmail.com' --mail-rcpt 'c.isaicu@gmail.com' --user 'fgolemo@gmail.com:cbpd uyvw pzqg fppq' -T <(echo -e "From: fgolemo@gmail.com\nTo: fgolemo@gmail.com,c.isaicu@gmail.com\nSubject: Training Done\n\nFinished TGAT model training of ==${ds}== on all seeds on GPU ==${gpu}==")





