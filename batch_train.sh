#!/bin/bash
#SBATCH --time=1:00:00

#SBATCH -p gpu --gres=gpu:1
#SBATCH --mem=64
#SBATCH -J train_twc_agent_easy
#SBATCH -e logs/wj_better_easy_GloVe_testing.err
#SBATCH -o logs/wj_better_easy_GloVe_testing.out

source /gpfs/runtime/opt/anaconda/3-5.2.0/etc/profile.d/conda.sh
echo loaded_anaconda_module

source activate /users/dsmits/anaconda/twc
echo activated_twc_env

# python3 -u test_agent.py --split test --pretrained_model ./results/simple_twc_glove_5runs_100episodes_3hsize_0.0eps_easy_direct_cdc_0runId.pt
#python -u test_agent.py --pretrained_model ./results/simple_twc_glove_5runs_100episodes_3hsize_0.0eps_easy_direct_cdc_0runId.pt
python -u train_agent.py --agent_type simple --game_dir ./games/twc --game_name *.ulx --difficulty_level easy

echo tested_agent
