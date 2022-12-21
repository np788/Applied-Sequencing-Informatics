#!/bin/bash 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=160gb # Job memory request 
#SBATCH --time=8:00:00 # Time limit hrs:min:sec 
#SBATCH --array=1-2
#SBATCH -p cpu_short

module load bowtie2/2.3.4.1
module load samtools/1.3
module load bedtools/2.26.0
module load ucscutils/374 # contains bedGraphToBigWig
module load macs/1.4.2
module load homer


# bowtie2 -x /gpfs/scratch/np788/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome \
# -1 /gpfs/scratch/np788/project/chip/trimmed/K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID\_R1_val_1.fq.gz \
# -2 /gpfs/scratch/np788/project/chip/trimmed/K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID\_R2_val_2.fq.gz \
# -S /gpfs/scratch/np788/project/chip/prac9/K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID.sam


# samtools view -bSo /gpfs/scratch/np788/project/chip/prac9/K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID.bam /gpfs/scratch/np788/project/chip/prac9/K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID.sam
# samtools sort /gpfs/scratch/np788/project/chip/prac9/K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID.bam > /gpfs/scratch/np788/project/chip/prac9/sorted_K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID.bam
# samtools index /gpfs/scratch/np788/project/chip/prac9/sorted_K562_FOXM1_ChIP_$SLURM_ARRAY_TASK_ID.bam

# multiBamSummary bins --bamfiles sorted_K562_FOXM1_ChIP_1.bam sorted_K562_FOXM1_ChIP_2.bam -o results.npz
# plotCorrelation --corData results.npz --corMethod spearman --skipZeros --plotTitle "Spearman Correlation of Read Counts" --whatToPlot heatmap --colorMap RdYlBu --plotNumbers -o heatmap_SpearmanCorr_readCounts.png --outFileCorMatrix SpearmanCorr_readCounts.tab

#macs2 callpeak -t /gpfs/scratch/np788/project/atac/sorted_K562_ATACseq_$SLURM_ARRAY_TASK_ID.bam -f BAMPE -n=atac$SLURM_ARRAY_TASK_ID --outdir /gpfs/scratch/np788/project/atac/callpeak_narrow
cat /gpfs/scratch/np788/project/chip/callpeak/chip1_peaks.narrowPeak /gpfs/scratch/np788/project/chip/callpeak/chip2_peaks.narrowPeak > /gpfs/scratch/np788/project/chip/callpeak/chip_combined.narrowPeak
sort -k1,1 -k2,2n /gpfs/scratch/np788/project/chip/callpeak/chip_combined.narrowPeak | bedtools merge -i - > /gpfs/scratch/np788/project/chip/callpeak/chip_combined.bed


annotatePeaks.pl /gpfs/scratch/np788/project/chip/callpeak/chip_combined.bed hg38 > /gpfs/scratch/np788/project/chip/callpeak/chip_combined_bed.txt
annotatePeaks.pl /gpfs/scratch/np788/project/chip/callpeak/chip_combined.narrowPeak hg38 > /gpfs/scratch/np788/project/chip/callpeak/chip_combined_narrowpeak.txt
