#!/bin/bash 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=8:00:00 # Time limit hrs:min:sec 
#SBATCH --array=1-2
#SBATCH -p cpu_short

module load hisat2/2.1.0

#Build HISAT2 index
#hisat2-build -p 16 /gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa hg38

bedtools intersect -a /gpfs/scratch/np788/project/atac/callpeak_broad/atac_broad_combined.bed -b /gpfs/scratch/np788/project/chip/callpeak/chip_combined.bed > /gpfs/scratch/np788/project/broad_int.bed
annotatePeaks.pl /gpfs/scratch/np788/project/broad_int.bed hg38 > /gpfs/scratch/np788/project/broad_int.txt

bedtools intersect -a /gpfs/scratch/np788/project/atac/callpeak_narrow/atac_narrow_combined.bed -b /gpfs/scratch/np788/project/chip/callpeak/chip_combined.bed > /gpfs/scratch/np788/project/narrow_int.bed
annotatePeaks.pl /gpfs/scratch/np788/project/narrow_int.bed hg38 > /gpfs/scratch/np788/project/narrow_int.txt




