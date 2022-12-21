#!/bin/bash 
#SBATCH --array=50-61
#SBATCH --mail-type=END # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=np788@nyu.edu # Where to send mail 
#SBATCH --ntasks=1 # Run on a single CPU 
#SBATCH --mem=16gb # Job memory request 
#SBATCH --time=1:59:59 # Time limit hrs:min:sec 

cd /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}
gunzip *trimmed.fq.gz