
module load vcftools 
module load gcc
module load bcftools
vcftools --gzvcf /netfiles/nunezlab/D_suzukii_resources/vcfs_gds/VT_individuals_2024_ORCC/final.AllChrs.Whatshap.annot.vcf.gz --min-alleles 2 --max-alleles 2 --max-missing 1.0 --recode --recode-INFO-all --out biallelic_no_missing
bgzip -c biallelic_no_missing.recode.vcf > biallelic_no_missing.recode.vcf.gz
tabix -p vcf biallelic_no_missing.recode.vcf.gz
rm biallelic_no_missing.recode.vcf

for chrom in chrX chr2L chr2R chr3 chr4; do
    bcftools view -r $chrom biallelic_no_missing.recode.vcf.gz -O z -o data/${chrom}.vcf.gz
    bcftools view data/${chrom}.vcf.gz -O b -o data/${chrom}.bcf
    rm data/${chrom}.vcf.gz
    bcftools index data/${chrom}.bcf
done
rm biallelic_no_missing.recode.vcf.gz
rm biallelic_no_missing.recode.vcf.gz.tbi
