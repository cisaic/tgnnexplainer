# call this script with `bash train_mooc_seeds.sh 0 mooc` to run all seeds on the first GPU with dataset wikipedia (TGN model)


gpu=$1
ds=$2

echo "run on GPU ${gpu} on dataset ${ds}"

printf "%s " "Press enter to continue"
read ans

for seed in 1 2 2020
do
    echo "=== STARTING TGN model training of ${ds} on seed ${seed} on GPU ${gpu} ==="
    python train_self_supervised.py -d ${ds} --prefix tgn-attn --n_layer 2 --node_dim 4 --time_dim 4 --message_dim 4 --memory_dim 4 --n_runs 1 --n_epoch 10 --n_layer 2 --n_degree 10 --use_memory --gpu ${gpu} --seed ${seed}
    echo "=== DONE TGN model training of ${ds} on seed ${seed} on GPU ${gpu} ==="
done


echo "good job :)"

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'fgolemo@gmail.com' --mail-rcpt 'fgolemo@gmail.com' --mail-rcpt 'c.isaicu@gmail.com' --user 'fgolemo@gmail.com:cbpd uyvw pzqg fppq' -T <(echo -e "From: fgolemo@gmail.com\nTo: fgolemo@gmail.com,c.isaicu@gmail.com\nSubject: Training Done\n\nFinished TGN model training of ==${ds}== on all seeds on GPU ==${gpu}==")






