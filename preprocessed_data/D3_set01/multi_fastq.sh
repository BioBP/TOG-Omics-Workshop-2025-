#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=8G
#SBATCH --time=01:00:00

module load fastqc


for fq in subsampled_R1.trim.fastq.gz subsampled_R2.trim.fastq.gz
n subsampled_R1.trim.fastq.gz subsampled_R2.trim.fastq.gz
R1_un.fastq.gz R2_un.fastq.gz;
do
fastqc --threads 2 $fq
done
