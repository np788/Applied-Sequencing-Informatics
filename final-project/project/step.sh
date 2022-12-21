#!/bin/bash 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=64gb # Job memory request 
#SBATCH --time=6:00:00 # Time limit hrs:min:sec 
#SBATCH -p cpu_short

#module load samtools/1.9
module load macs/1.4.2
module load samtools/1.3
module load bedtools/2.26.0
module load ucscutils/374 # contains bedGraphToBigWig
 
cd /gpfs/scratch/np788/project/atac

multiBamSummary bins --bamfiles sorted_K562_ATACseq_1.bam sorted_K562_ATACseq_2.bam sorted_K562_ATACseq_3.bam -o results.npz