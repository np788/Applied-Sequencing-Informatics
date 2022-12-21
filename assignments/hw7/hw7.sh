#!/bin/bash 
#SBATCH --job-name=canu  # Job name 
#SBATCH --ntasks=1 # Run on a single CPU 
#SBATCH --mem=32gb # Job memory request 
#SBATCH --time=4:00:00 # Time limit hrs:min:sec 
#SBATCH -p cpu_short

# srun --partition=gpu4_dev --nodes=1  --cpus-per-task=1 --gres=gpu:2 --x11 --pty bash

module load guppy/3.6.0
module load minimap2
module load samtools/1.9
module load bedtools/2.27.1 
module load canu/2.2
module load racon
module load medaka/1.1.3

#guppy_basecaller -i /gpfs/data/courses/bminga3004/Practicum10/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/ -s basecalledRun -c dna_r9.5_450bps.cfg -r --trim_strategy dna -x auto

guppy_basecaller -i /gpfs/data/courses/bminga3004/Practicum10/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086/ -s basecalledRun --flowcell FLO-MIN106 --kit SQK-PCS109 -r --trim_strategy dna -x auto

# guppy_basecaller \
# -i /gpfs/data/courses/bminga3004/Practicum10/Assignment/MuAstLab/20200921_1902_MN24978_AEI124_1004c086 \
# -s basecalledRun \
# --flowcell FLO-MIN106 \
# --kit SQK-RNA002 \
# -r \
# --trim_strategy rna \
# --reverse_sequence true \
# --u_substitution true \
# -x auto

cat /gpfs/scratch/np788/hw7/basecalledRun/*fastq > basecalled.fastq

#START HERE
minimap2 -ax map-ont /gpfs/data/courses/bminga3004/BigPurpleTraining/MuAstVirOut.fasta /gpfs/scratch/np788/hw7/basecalled.fastq> aln.sam

#minimap2 -ax -uf -k14 /gpfs/data/courses/bminga3004/BigPurpleTraining/MuAstVirOut.fasta /gpfs/scratch/np788/hw7/basecalled.fastq> aln.sam #Used splice mode because we're aligning RNA data
#minimap2 -ax splice -uf -k14 /gpfs/data/courses/bminga3004/BigPurpleTraining/MuAstVirOut.fasta /gpfs/scratch/np788/hw7/basecalled.fastq> aln.sam #Used splice mode because we're aligning RNA data
#minimap2 -ax splice -k 8 -w 3 -g 7000 -G 7000 -C0 -un --no-end-flt --splice-flank=no /gpfs/data/courses/bminga3004/BigPurpleTraining/MuAstVirOut.fasta /gpfs/scratch/np788/hw7/basecalled.fastq> aln.sam

samtools view -b -o /gpfs/scratch/np788/hw7/aln.bam /gpfs/scratch/np788/hw7/aln.sam
samtools sort -o sorted.bam /gpfs/scratch/np788/hw7/aln.bam
samtools index sorted.bam

# bedtools bamtobed -i /gpfs/scratch/np788/hw7/sorted.bam > /gpfs/scratch/np788/hw7/sorted.bed
# bedtools bamtobed -i /gpfs/scratch/np788/hw7/sorted.bam

#bedtools bamtofastq -i sorted.bam -fq sorted.fq
samtools bam2fq sorted.bam > sorted.fastq

canu -p ast -d /gpfs/scratch/np788/hw7/ genomeSize=0.007m gridOptionsJobName=Canu_denovo.assembly "gridOptions=--time 6:00:00" -nanopore-raw /gpfs/scratch/np788/hw7/sorted.fastq

minimap2 -x map-ont -t 8 ast.contigs.fasta sorted.fastq > mapping1.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 sorted.fastq mapping1.paf ast.contigs.fasta > racon1.fasta

minimap2 -x map-ont -t 8 racon1.fasta sorted.fastq > mapping2.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 sorted.fastq mapping2.paf racon1.fasta > racon2.fasta

minimap2 -x map-ont -t 8 racon2.fasta sorted.fastq > mapping3.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 sorted.fastq mapping3.paf racon2.fasta > racon3.fasta

minimap2 -x map-ont -t 8 racon3.fasta sorted.fastq > mapping4.paf
racon -m 8 -x -6 -g -8 -w 500 -t 14 sorted.fastq mapping4.paf racon3.fasta > racon4.fasta


medaka_consensus -i sorted.fastq -d racon4.fasta -o medaka -m r941_min_high_g360 -t 24

medaka_variant -i sorted.bam -f /gpfs/scratch/np788/hw7/medaka/consensus.fasta -s r941_min_high_g360 -m r941_min_high_g360 -t 24

#medaka_variant -i sorted.bam -f MuAstVirOut.fasta -s r941_min_high_g360 -m r941_min_high_g360 -t 24
# medaka_haploid_variant sorted.fastq racon4.fasta --model r941_min_high_g360 -t 24
