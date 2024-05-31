# Slurm script           
```
#!/bin/bash -l
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
module load nf-core/2.13.1 

OUTDIR=/path/to/output/

FASTA=hg38.fa.gz
GTF=hg38.ncbiRefSeq.gtf.gz

nextflow run nf-core/rnaseq \
    --input samplesheets.csv \
    --outdir $OUTDIR \
    --fasta $FASTA \
    --gtf $GTF \
    -profile tufts 
```

# samplesheets.csv                
```
sample,fastq_1,fastq_2,strandedness
A549_GFPkd_1,SRX1693951_SRR3362661_1.fastq.gz,SRX1693951_SRR3362661_2.fastq.gz,auto
A549_GFPkd_2,SRX1693952_SRR3362662_1.fastq.gz,SRX1693952_SRR3362662_2.fastq.gz,auto
A549_GFPkd_3,SRX1693953_SRR3362663_1.fastq.gz,SRX1693953_SRR3362663_2.fastq.gz,auto
A549_PRMT5kd_1,SRX1693954_SRR3362664_1.fastq.gz,SRX1693954_SRR3362664_2.fastq.gz,auto
A549_PRMT5kd_2,SRX1693955_SRR3362665_1.fastq.gz,SRX1693955_SRR3362665_2.fastq.gz,auto
A549_PRMT5kd_3,SRX1693956_SRR3362666_1.fastq.gz,SRX1693956_SRR3362666_2.fastq.gz,auto
A549_MEP50kd_1,SRX1693957_SRR3362667_1.fastq.gz,SRX1693957_SRR3362667_2.fastq.gz,auto
A549_MEP50kd_2,SRX1693958_SRR3362668_1.fastq.gz,SRX1693958_SRR3362668_2.fastq.gz,auto
A549_MEP50kd_3,SRX1693959_SRR3362669_1.fastq.gz,SRX1693959_SRR3362669_2.fastq.gz,auto
```
