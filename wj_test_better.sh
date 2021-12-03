#!/bin/bash
#SBATCH --time=48:00:00

#SBATCH -p gpu --gres=gpu:1
#SBATCH --mem=32G
#SBATCH -J test_twc_agent_easy
#SBATCH -e logs/wj_better_easy_GloVe_testing.err
#SBATCH -o logs/wj_better_easy_GloVe_testing.out

source /gpfs/runtime/opt/anaconda/2020.02/etc/profile.d/conda.sh
echo loaded_anaconda_module
module load gcc/10.2
module load cuda/11.3.1

conda activate ../twc-nate
echo activated_twc_env

# python3 -u test_agent.py --split test --pretrained_model ./results/simple_twc_glove_5runs_100episodes_3hsize_0.0eps_easy_direct_cdc_0runId.pt
python -u test_agent.py --pretrained_model ./results/simple_twc_glove_5runs_100episodes_3hsize_0.0eps_easy_direct_cdc_0runId.pt
echo tested_agent
