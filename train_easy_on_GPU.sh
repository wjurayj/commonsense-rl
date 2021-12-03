#!/bin/bash
#SBATCH --time=12:00:00

#SBATCH -p gpu --gres=gpu:1
#SBATCH --mem=32G
#SBATCH -J train_twc_agent_easy_v2
#SBATCH -e logs/experiment.err
#SBATCH -o logs/experiment.out


# can't do "module load anaconda/2020.02" inside a batch script for some reason...
source /gpfs/runtime/opt/anaconda/2020.02/etc/profile.d/conda.sh
echo loaded_anaconda_module

# conda init bash
# echo inited_bash

# conda info --envs
# echo printed_available_envs

conda activate /users/ngillman/anaconda/twc-nate
echo activated_twc_env

python -u train_agent.py --agent_type simple --game_dir ./games/twc --game_name *.ulx --difficulty_level easy
echo trained_agent