#!/bin/bash
#SBATCH --array=50-61
#SBATCH --mail-type=END # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=np788@nyu.edu # Where to send mail 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=11:59:59 # Time limit hrs:min:sec 

module load star


STAR --runThreadN 23 --runMode genomeGenerate --genomeDir /gpfs/scratch/np788/hw6/hg38_index_ucsc --genomeFastaFiles /gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa --sjdbGTFfile /gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes.gencode/genes.gtf --sjdbOverhang 99

STAR --genomeDir /gpfs/scratch/np788/hw6/hg38_index_ucsc/ \
--runThreadN 23 \
--readFilesIn /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/SRR79924${SLURM_ARRAY_TASK_ID}_1_trimmed.fq \
--outFileNamePrefix /gpfs/scratch/np788/hw6/SRR79924${SLURM_ARRAY_TASK_ID}/SRR79924${SLURM_ARRAY_TASK_ID} \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard