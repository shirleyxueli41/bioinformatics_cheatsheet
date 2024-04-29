#!/bin/bash
#SBATCH -J nfcore_rnaseq
#SBATCH --time=24:00:00
#SBATCH -p batch
#SBATCH -n 2
#SBATCH --mem=50G
#SBATCH --output=MyJob.%j.out
#SBATCH --error=MyJob.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=name@tufts.edu

module load singularity/3.8.4
module load nf-core-taxprofiler/1.1.6 

OUTDIR=/path/to/output/

FASTA=hg38.fa.gz
GTF=hg38.ncbiRefSeq.gtf.gz

nextflow run nf-core/rnaseq \
    --input nfcore_rnaseq_samplesheets.csv \
    --outdir $OUTDIR \
    --fasta $FASTA \
    --gtf $GTF \
    -profile tufts 


