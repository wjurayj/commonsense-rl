#!/bin/bash
#SBATCH --time=11:59:59

#SBATCH -p gpu --gres=gpu:1
#SBATCH --mem=256G
#SBATCH -J train_twc_agent_medium_v2
#SBATCH -e logs/experiment256.err
#SBATCH -o logs/experiment256.out


# can't do "module load anaconda/2020.02" inside a batch script for some reason...
source /gpfs/runtime/opt/anaconda/2020.02/etc/profile.d/conda.sh
echo loaded_anaconda_module
module load gcc/10.2
module load cuda/11.3.1

# conda init bash
# echo inited_bash

# conda info --envs
# echo printed_available_envs

conda activate ../twc-nate
echo activated_twc_env

python -u train_agent.py --agent_type simple --game_dir ./games/twc --game_name *.ulx --difficulty_level medium
echo trained_agent
