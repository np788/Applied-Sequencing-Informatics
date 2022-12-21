#!/bin/bash
#SBATCH --array=1,2,3
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=np788@nyu.edu # Where to send mail
#SBATCH --ntasks=4
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=12:00:00 # Time limit hrs:min:sec

module load trimgalore/0.5.0
module load python/cpu/2.7.15-ES

trim_galore --paired --length 30 -o /gpfs/scratch/np788/project4/atac/trimmed /gpfs/scratch/np788/project4/atac/K562_ATACseq_${SLURM_ARRAY_TASK_ID}_R1.fastq.gz /gpfs/scratch/np788/project4/atac/K562_ATACseq_${SLURM_ARRAY_TASK_ID}_R2.fastq.gz




