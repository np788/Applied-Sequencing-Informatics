#!/bin/bash
#SBATCH --array=50-61
#SBATCH --mail-type=END # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=np788@nyu.edu # Where to send mail 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=11:59:59 # Time limit hrs:min:sec 

module load samtools/1.9
module load bedtools/2.27.1

samtools view -b /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/SRR79924${SLURM_ARRAY_TASK_ID}Aligned.sortedByCoord.out.bam | genomeCoverageBed -ibam stdin -bg > /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/SRR79924${SLURM_ARRAY_TASK_ID}.bedgraph
