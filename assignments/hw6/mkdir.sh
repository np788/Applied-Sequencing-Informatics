#!/bin/bash
#SBATCH --array=50-61
#SBATCH --time=1:59:59 # Time limit hrs:min:sec 

cd /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}

mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/all
mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/pri

mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/all/star
mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/all/sam

mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/pri/star
mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/pri/sam