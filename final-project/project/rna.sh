#!/bin/bash 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=8:00:00 # Time limit hrs:min:sec 
#SBATCH --array=1-2
#SBATCH -p cpu_short

module load samtools/1.9

# Align RNA data - HISAT2 OK

hisat2 -p 16 -x /gpfs/scratch/np788/project/hg38/hg38 \
-1 /gpfs/scratch/np788/project/rna/trimmed/K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID\_R1_val_1.fq.gz \
-2 /gpfs/scratch/np788/project/rna/trimmed/K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID\_R2_val_2.fq.gz \
-S /gpfs/scratch/np788/project/rna/K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID.sam

hisat2 -p 16 -x /gpfs/scratch/np788/project/hg38/hg38 \
-1 /gpfs/scratch/np788/project/rna/trimmed/K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID\_R1_val_1.fq.gz \
-2 /gpfs/scratch/np788/project/rna/trimmed/K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID\_R2_val_2.fq.gz \
-S /gpfs/scratch/np788/project/rna/K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID.sam

#SAM to sorted BAM

samtools view -b -o /gpfs/scratch/np788/project/rna/K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/rna/K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID.sam
samtools sort -o /gpfs/scratch/np788/project/rna/sorted_K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/rna/K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID.bam
samtools index /gpfs/scratch/np788/project/rna/sorted_K562_Control_RNA_Rep$SLURM_ARRAY_TASK_ID.bam

samtools view -b -o /gpfs/scratch/np788/project/rna/K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/rna/K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID.sam
samtools sort -o /gpfs/scratch/np788/project/rna/sorted_K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/rna/K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID.bam
samtools index /gpfs/scratch/np788/project/rna/sorted_K562_FOXM1_CRISPR_RNA_Rep$SLURM_ARRAY_TASK_ID.bam

