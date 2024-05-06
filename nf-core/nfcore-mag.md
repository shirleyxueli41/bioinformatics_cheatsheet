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

cd /cluster/tufts/xli37/research/naz/analysis/Illumina_mag/
OUTDIR=/cluster/tufts/xli37/research/naz/analysis/Illumina_mag/

module load singularity/3.8.4
# module load nf-core-mag/2.5.4
module load nf-core/2.13.1

INPUT='/cluster/tufts/xli37/research/naz/rawdata/NevedaNaz211208-selected/IlluminaReads/120821_240/Gloeocapsa_*_R{1,2}_001.fastq.gz'

nextflow run nf-core/mag -profile tufts \
	--input samplesheet.csv \
	--outdir $OUTDIR \
	--kraken2_db /cluster/tufts/biocontainers/datasets/kraken2/k2_minusb_20240112.tar.gz \
	--skip_spades \
	-resume \
	--multiqc_title Gloeocapsa
```

