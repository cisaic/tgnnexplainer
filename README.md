This repo is cloned from the repo [chaosido/FACT-course](https://github.com/chaosido/FACT-course/tree/dev). To see the changelog used for this project, see the original repo.

# :sparkles: TGNExplainer reproduction :sparkles:

This repo is ment to ease the reproduction of results of [TGNNExplainer](https://openreview.net/forum?id=BR_ZhvcYbGJ). 
In addition this repository adds two more open-source datasets for training on the proposed methodology.

# Download wikipedia and reddit datasets
Download from http://snap.stanford.edu/jodie/wikipedia.csv and http://snap.stanford.edu/jodie/reddit.csv and http://snap.stanford.edu/jodie/mooc.csv
https://snap.stanford.edu/data/soc-redditHyperlinks-body.tsv
and put them into ~/workspace/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/dataset/data

The reddit_hyperlinks dataset should be converted to .csv format and preprocessed.
Preprocessing reddit_hyperlinks can be done [here](https://drive.google.com/file/d/12PFfaXZWMgd_4179uGu-eJAUJGBu9n0G/view?usp=sharing).

# setting up training evironment
```
conda env create -f conda_fact.yml
```
This environment is incompatible with Tick.

# Preprocess real-world datasets
```
cd  ~/workspace/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/models/ext/tgat
python process.py -d wikipedia
python process.py -d reddit
python process.py -d mooc
python process py -d reddit_hyperlinks
```

# Generate simulate dataset
```
cd  ~/workspace/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/dataset
python generate_simulate_dataset.py -d simulate_v1
python generate_simulate_dataset.py -d simulate_v2
```
This step generates the simulate datasets with Tick. note that the Tick module is depricated for Py>3.7.
 It is advised to create a new conda environment with py=3.7. to install the Tick module and generate the syntetic datasets.


# Generate explain indexs
```
cd  ~/workspace/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/dataset
python tg_dataset.py -d reddit -c index
```
This step creates a test set for the explainers. it randomly selects 500 indexes from the full test set.

# Train tgat/tgn model
tgat:
```
cd  ~/workspace/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/models/ext/tgat
./train.sh
./cpckpt.sh
```

tgn:
```
cd  ~/workspace/TGNNEXPLAINER-PUBLIC/tgnnexplainer/xgraph/models/ext/tgn
./train.sh
./cpckpt.sh
```

The cpckpt.sh ensures that the saved TGAT
model is findable during the explainer training. make sure cpckpt.sh is ran for for each model dataset combination

# Run our explainer and other  baselines
```
cd  ~/workspace/TGNNEXPLAINER-PUBLIC/benchmarks/xgraph
./run_explainers_model_dataset.sh
``` 
In the benchmars directory a shell script exists for training all 4 explainers on a (dataset,model) combination. 


dataset= reddit, Wikipedia, simulate_v1, simulate_v2, mooc, reddit_hyperlinks.
model= TGAT,TGN
