#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --mem=10G
#SBATCH --cpus-per-task=2


# -----------------------------
# Load required modules
# -----------------------------
module load trimmomatic


# -----------------------------
# Define paths and variables
# -----------------------------
INPUT_DIR=~/scratch/omics_workshop/preprocessed_data/D2_set01
OUTPUT_DIR=~/scratch/omics_workshop/preprocessed_data/D3_set01


# Move to output directory
cd $OUTPUT_DIR


# -----------------------------
# Run Trimmomatic
# -----------------------------

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -threads 2 \
$INPUT_DIR/subsampled_R1.fastq.gz $INPUT_DIR/subsampled_R2.fastq.gz \
subsampled_R1.trim.fastq.gz R1_un.fastq.gz \
subsampled_R2.trim.fastq.gz R2_un.fastq.gz \
SLIDINGWINDOW:3:20 MINLEN:50
