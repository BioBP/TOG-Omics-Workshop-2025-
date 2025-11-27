#!/bin/bash
#SBATCH --job-name=checkpoint_demo
#SBATCH --output=cp_demo_%j.out
#SBATCH --time=00:10:00
#SBATCH --mem=1G
#SBATCH --cpus-per-task=1


module load python/3.11  


python ~/scratch/omics_workshop/scripts/cp_demo.py

