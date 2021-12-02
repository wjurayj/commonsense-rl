#!/bin/bash
#SBATCH --time=48:00:00

#SBATCH -p gpu --gres=gpu:1
#SBATCH --mem=32G
#SBATCH -J test_twc_agent_easy
#SBATCH -e logs/easy_GloVe_testing.err
#SBATCH -o logs/easy_GloVe_testing.out

source /gpfs/runtime/opt/anaconda/2020.02/etc/profile.d/conda.sh
echo loaded_anaconda_module

git checkout working
echo did_git_checkout_working

conda activate /users/ngillman/anaconda/twc-nate
echo activated_twc_env

python -u test_agent.py --pretrained_model ./results/simple_twc_glove_5runs_100episodes_3hsize_0.0eps_easy_direct_cdc_0runId.pt
echo tested_agent