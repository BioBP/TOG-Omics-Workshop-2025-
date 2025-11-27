#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --time=01:00:00

module load fastqc/0.11.9


fastqc --threads 1 ~/scratch/omics_workshop/preprocessed_data/D2_set01/subsampled_R1.fastq.gz
