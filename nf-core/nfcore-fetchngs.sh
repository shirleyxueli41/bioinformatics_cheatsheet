#!/bin/bash
#SBATCH -J fetchngs
#SBATCH --time=4:00:00
#SBATCH -p batch
#SBATCH -n 2
#SBATCH --mem=8g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=name@tufts.edu

module load  nf-core-fetchngs/1.12.0 

fetchngs -profile tufts \
	    --input ids.csv \
        --download_method aspera \
        --nf_core_pipeline rnaseq \
        --outdir ./fetchngsout

