#!/bin/bash 
#SBATCH --job-name=astro_minimap2  # Job name 
#SBATCH --ntasks=1 # Run on a single CPU 
#SBATCH --mem=32gb # Job memory request 
#SBATCH --time=4:00:00 # Time limit hrs:min:sec 
#SBATCH -p cpu_short


module load minimap2/2.15
module load samtools/1.9
#module load bedtools/2.27.1

while read i;

do
echo $i

minimap2 -ax splice -k 8 -w 3 -g 7000 -G 7000 -C0 -un --no-end-flt --splice-flank=no /gpfs/data/courses/bminga3004/BigPurpleTraining/MuAstVirOut.fasta /gpfs/scratch/np788/hw7/MuAst2019-hac-v3-6-0/"$i".fastq > /gpfs/scratch/np788/hw7/"$i".sam