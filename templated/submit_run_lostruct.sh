#!/bin/sh
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=lostruct

# Name the output file 
#SBATCH --output=/users/j/m/jmin1/scratch/slurm_out/lostruct_%j.out
#SBATCH --error=/users/j/m/jmin1/scratch/slurm_err/lostruct_%j.err

module load R
module load gcc
module load bcftools
echo "start analysis with 100 snps window"
./compute_mds_by_chr.R -i data -t snp -s 100 -I data/suzukii_sample_info.tsv -j 0001
echo "finished runing with 100 snps window. Start next analysis with 500 snps window"

./compute_mds_by_chr.R -i data -t snp -s 500 -I data/suzukii_sample_info.tsv -j 0001
echo "finished runing with 500 snps window. Start next analysis with 1000 snps window"
./compute_mds_by_chr.R -i data -t snp -s 1000 -I data/suzukii_sample_info.tsv -j 0001
echo "finished runing with 1000 snps window."
