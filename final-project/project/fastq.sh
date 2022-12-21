#!/bin/bash
#SBATCH --ntasks=4
#SBATCH --mem=32gb # Job memory request
#SBATCH --time=12:00:00 # Time limit hrs:min:sec

module load fastq
fastqc *.gz