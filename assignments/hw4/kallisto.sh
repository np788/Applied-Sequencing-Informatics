#!/bin/bash 
#SBATCH --array=34,35,36,46,47,48
#SBATCH --mail-type=END,FAIL # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=np788@nyu.edu # Where to send mail 
#SBATCH --ntasks=4 # Run on a single CPU 
#SBATCH --mem=32gb # Job memory request 
#SBATCH --time=12:00:00 # Time limit hrs:min:sec 
#SBATCH --output=/gpfs/scratch/np788/Practicum5/Kallisto_%j.log # Standard output and error log 
#SBATCH -p cpu_short

module load kallisto/0.44.0

#USE RAW DATA!!!!!!!


### Indexing 
#kallisto index -i /gpfs/data/courses/bminga3004/Practicum5/HomoSapiens /gpfs/data/courses/bminga3004/Practicum5/Homo_sapiens.GRCh38.all.cds.ncrna.fa

# while read i;

# do
# echo $i

# kallisto quant -i /gpfs/scratch/np788/Practicum5/Assignment/hsnp -o /gpfs/scratch/np788/Practicum5/Assignment/Kallisto/LT${SLURM_ARRAY_TASK_ID} -b 100 --bias /gpfs/scratch/np788/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R1.fastq.gz /gpfs/scratch/np788/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R2.fastq.gz

#kallisto quant -i /gpfs/data/courses/bminga3004/Practicum5/Homo_sapiens.GRCh38.cdna.all.fa -o /gpfs/scratch/np788/Practicum5/Assignment/Kallisto/LT${SLURM_ARRAY_TASK_ID} -b 100 --bias /gpfs/scratch/np788/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R1.fastq.gz /gpfs/scratch/np788/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R2.fastq.gz

kallisto quant -i /gpfs/data/courses/bminga3004/Practicum5/HomoSapiens -o /gpfs/scratch/np788/Practicum5/Assignment/Kallisto/LT${SLURM_ARRAY_TASK_ID} -b 100 --bias /gpfs/scratch/np788/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R1.fastq.gz /gpfs/scratch/np788/Practicum5/Assignment/LT${SLURM_ARRAY_TASK_ID}_R2.fastq.gz



# done < /gpfs/data/courses/bminga3004/Practicum5/Session/list.txt









