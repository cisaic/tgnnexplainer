# i mean not literally

# call this script with `bash train_realmodels_seeds.sh 0 wikipedia` to run all seeds on the first GPU with dataset wikipedia


gpu=$1
ds=$2


echo "run on GPU ${gpu} on dataset ${ds}"

printf "%s " "Press enter to continue"
read ans

for seed in 1 2 2020
do
    echo "=== STARTING TGAT model training of ${ds} on seed ${seed} on GPU ${gpu} ==="
    python learn_edge.py -d ${ds} --bs 512 --n_degree 10 --n_epoch 10 --agg_method attn --node_dim 172 --time_dim 172 --attn_mode prod --gpu ${gpu} --n_head 2 --prefix ${ds} --seed ${seed}
    echo "=== DONE TGAT model training of ${ds} on seed ${seed} on GPU ${gpu} ==="
done


echo "good job :)"

curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd --mail-from 'fgolemo@gmail.com' --mail-rcpt 'fgolemo@gmail.com' --mail-rcpt 'c.isaicu@gmail.com' --user 'fgolemo@gmail.com:cbpd uyvw pzqg fppq' -T <(echo -e "From: fgolemo@gmail.com\nTo: fgolemo@gmail.com,c.isaicu@gmail.com\nSubject: Training Done\n\nFinished TGAT model training of ==${ds}== on all seeds on GPU ==${gpu}==")





