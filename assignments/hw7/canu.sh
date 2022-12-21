#!/bin/bash 
#SBATCH --job-name=canu  # Job name 
#SBATCH --ntasks=1 # Run on a single CPU 
#SBATCH --mem=32gb # Job memory request 
#SBATCH --time=4:00:00 # Time limit hrs:min:sec 
#SBATCH -p cpu_short


canu -p ast -d /gpfs/scratch/np788/hw7/ genomeSize=0.007m gridOptionsJobName=Canu_denovo.assembly "gridOptions=--time 6:00:00" -nanopore-raw /gpfs/scratch/np788/hw7/sorted.fastq