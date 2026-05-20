#!/bin/sh
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --time=5:00:00
#SBATCH --job-name=lostruct

# Name the output file 
#SBATCH --output=%x_%j.out
module load R
module load gcc
module load bcftools
./run_lostruct.R -i data -t snp -s 100 -I data/suzukii_sample_info.tsv -j 0001
