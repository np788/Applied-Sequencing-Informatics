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
module load homer

# Align ATAC data (array 1-3)
# bowtie2 -x /gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome \
# -1 /gpfs/scratch/np788/project/atac/trimmed/K562_ATACseq_$SLURM_ARRAY_TASK_ID\_R1_val_1.fq.gz \
# -2 /gpfs/scratch/np788/project/atac/trimmed/K562_ATACseq_$SLURM_ARRAY_TASK_ID\_R2_val_2.fq.gz \
# -S /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.sam

# SAM to sorted BAM 

# samtools view -b -o /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.sam
# samtools sort -o /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/atac/K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam
# samtools index /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam


#multiBamSummary bins --bamfiles sorted_K562_ATACseq_1.bam sorted_K562_ATACseq_2.bam sorted_K562_ATACseq_3.bam -o results.npz

# Merge replicate peak files. Sort per https://github.com/hbctraining/Intro-to-ChIPseq/blob/master/lessons/data_visualization_with_bedtools.md

# BROAD
macs2 callpeak -t /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam --broad -f BAMPE -n=atac$SLURM_ARRAY_TASK_ID --outdir /gpfs/scratch/np788/project/atac/callpeak_broad
cat atac1_peaks.broadPeak atac2_peaks.broadPeak atac3_peaks.broadPeak > atac_broad_combined.broadPeak
sort -k1,1 -k2,2n atac_broad_combined.broadPeak | bedtools merge -i - > atac_broad_combined.bed

annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak_broad/atac_broad_combined.broadPeak hg38 > /gpfs/scratch/np788/project/atac/callpeak_broad/atac_broad_combined_broadPeak.txt
annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak_broad/atac_broad_combined.bed hg38 > /gpfs/scratch/np788/project/atac/callpeak_broad/atac_broad_combined_bed.txt



# NARROW
macs2 callpeak -t /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam -f BAMPE -n=atac$SLURM_ARRAY_TASK_ID --outdir /gpfs/scratch/np788/project/atac/callpeak_narrow
cat atac1_peaks.narrowPeak atac2_peaks.narrowPeak atac3_peaks.narrowPeak > atac_narrow_combined.narrowPeak
sort -k1,1 -k2,2n atac_narrow_combined.narrowPeak | bedtools merge -i - > atac_narrow_combined.bed

annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak_narrow/atac_narrow_combined.narrowPeak hg38 > /gpfs/scratch/np788/project/atac/callpeak_narrow/atac_narrow_combined_narrowPeak.txt
annotatePeaks.pl /gpfs/scratch/np788/project/atac/callpeak_narrow/atac_narrow_combined.bed hg38 > /gpfs/scratch/np788/project/atac/callpeak_narrow/atac_narrow_combined_bed.txt
