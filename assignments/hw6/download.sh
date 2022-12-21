#!/bin/bash 
#SBATCH --array=50-61
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=np788@nyu.edu # Where to send mail 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=128gb # Job memory request 
#SBATCH --time=10:00:00 # Time limit hrs:min:sec 


#module load sratoolkit/2.9.1
#module load trimgalore/0.5.0
#module load python/cpu/2.7.15-ES
#module load fastqc/0.11.7


mkdir /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}

fastq-dump --split-files SRR79924${SLURM_ARRAY_TASK_ID} --gzip -O /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID} --origfmt

trim_galore --length 30 -o /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID} /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/SRR79924${SLURM_ARRAY_TASK_ID}_1.fastq.gz

fastqc -o /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID} /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/SRR79924${SLURM_ARRAY_TASK_ID}_1_trimmed.fq.gz
