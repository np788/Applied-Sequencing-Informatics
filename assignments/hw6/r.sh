#!/bin/bash 
#SBATCH --mail-type=END # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=np788@nyu.edu # Where to send mail 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=11:59:59 # Time limit hrs:min:sec

module load r

Rscript exomePeak2.R