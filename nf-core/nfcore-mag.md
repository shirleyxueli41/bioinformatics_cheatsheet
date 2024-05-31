# Slurm script      
```
#!/bin/bash
#SBATCH -J nfcore_mag
#SBATCH --time=120:00:00
#SBATCH -p batch
#SBATCH -n 20
#SBATCH --mem=100g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=xue.li37@tufts.edu

OUTDIR=/your/output/dir/

module load singularity/3.8.4
module load nf-core/2.13.1

nextflow run nf-core/mag -profile tufts \
	--input samplesheet.csv \
	--outdir $OUTDIR \
	--kraken2_db /cluster/tufts/biocontainers/datasets/kraken2/k2_minusb_20240112.tar.gz 
```

# samplesheet.csv 
```
sample,group,short_reads_1,short_reads_2,long_reads
samplename,0,samplename_R1.fastq.gz,samplename_R2.fastq.gz,samplename_longreads.fastq.gz
```
Note: long read fastq file is not necessary. 
