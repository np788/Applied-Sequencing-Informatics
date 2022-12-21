#!/bin/bash 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=8:00:00 # Time limit hrs:min:sec 
#SBATCH --array=1-3
#SBATCH -p cpu_short

module load macs/1.4.2
module load bedtools
module load samtools/1.3
module load deeptools

# Align ATAC data (array 1-3)
# hisat2 -p 16 -x /gpfs/scratch/np788/project/hg38/hg38 \
# -1 /gpfs/scratch/np788/project/atac/trimmed/K562_ATACseq_$SLURM_ARRAY_TASK_ID\_R1_val_1.fq.gz \
# -2 /gpfs/scratch/np788/project/atac/trimmed/K562_ATACseq_$SLURM_ARRAY_TASK_ID\_R2_val_2.fq.gz \
# -S /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.sam

# bowtie2 -x /gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome \
# -1 /gpfs/scratch/np788/project/atac/trimmed/K562_ATACseq_$SLURM_ARRAY_TASK_ID\_R1_val_1.fq.gz \
# -2 /gpfs/scratch/np788/project/atac/trimmed/K562_ATACseq_$SLURM_ARRAY_TASK_ID\_R2_val_2.fq.gz \
# -S /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.sam

# SAM to sorted BAM 

# samtools view -b -o /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.sam
# samtools sort -o /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam
# samtools index /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam


#multiBamSummary bins --bamfiles sorted_K562_ATACseq_1.bam sorted_K562_ATACseq_2.bam sorted_K562_ATACseq_3.bam -o results.npz

macs2 callpeak -t /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam --broad -f BAMPE -n=atac$SLURM_ARRAY_TASK_ID --outdir /gpfs/scratch/np788/project/atac/callpeak

# Merge replicate narrowPeaks files
# cat atac1_peaks.narrowPeak atac2_peaks.narrowPeak atac3_peaks.narrowPeak > all_atac_narrowpeaks.bed

# Peak annotation
# annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak/atac1_peaks.narrowPeak hg38 > /gpfs/scratch/np788/project/atac/output1.txt
# annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak/atac2_peaks.narrowPeak hg38 > /gpfs/scratch/np788/project/atac/output2.txt
# annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak/atac3_peaks.narrowPeak hg38 > /gpfs/scratch/np788/project/atac/output3.txt

