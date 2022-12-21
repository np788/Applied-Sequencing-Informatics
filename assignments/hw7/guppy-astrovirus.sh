#!/bin/bash 
#SBATCH --job-name=guppy_astro  # Job name 
#SBATCH --ntasks=1
#SBATCH --mem=32gb # Job memory request 
#SBATCH --time=2:00:00 # Time limit hrs:min:sec 
#SBATCH -p gpu8_short
#SBATCH --gres=gpu:1


module load guppy/3.6.0

cd /gpfs/scratch/np788/hw7

guppy_basecaller -i /gpfs/data/courses/bminga3004/Practicum10/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/ -s /gpfs/scratch/np788/hw7/MuAst2019-hac-v3-6-0 -c dna_r9.4.1_450bps_hac.cfg -r --trim_strategy dna -x auto

cat /gpfs/scratch/np788/hw7/MuAst2019-hac-v3-6-0/*.fastq > /gpfs/scratch/np788/hw7/MuAst2019-hac.v3.6.0.fastq

####

# You will need to add you email address to --mail-user
# You will need to replace all instances of KERBOROSID with your kerberos ID



