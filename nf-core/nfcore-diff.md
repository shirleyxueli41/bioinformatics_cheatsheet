```
#!/bin/bash -l
#SBATCH -J diff
#SBATCH --time=24:00:00 
#SBATCH -p batch 
#SBATCH -n 2
#SBATCH --mem=10g 
#SBATCH --output=diff.%j.%N.out 
#SBATCH --error=diff.%j.%N.err 
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=name@tufts.edu

module load singularity/3.8.4
module load nf-core/2.13.1
#module load nf-core-differentialabundance/1.5.0 

OUTDIR=/path/to/your/output/

# genome build GRCm39
GTF=Mus_musculus.GRCm39.112.gtf.gz

MATRIX=./star_salmon/salmon.merged.gene_counts.tsv

nextflow run nf-core/differentialabundance \
        --input samplesheet.csv \
        --contrasts contrasts.csv \
        --matrix $MATRIX \
        --outdir $OUTDIR \
        --gtf $GTF \
        -profile tufts


```

## samplesheet.csv     
```
sample,fastq_1,fastq_2,condition,replicate,batch
CONTROL_REP1,AEG588A1_S1_L002_R1_001.fastq.gz,AEG588A1_S1_L002_R2_001.fastq.gz,control,1,A
CONTROL_REP2,AEG588A1_S1_L003_R1_001.fastq.gz,AEG588A1_S1_L003_R2_001.fastq.gz,control,2,B
CONTROL_REP3,AEG588A1_S1_L004_R1_001.fastq.gz,AEG588A1_S1_L004_R2_001.fastq.gz,control,3,A
TREATED_REP1,AEG588A2_S1_L002_R1_001.fastq.gz,AEG588A2_S1_L002_R2_001.fastq.gz,treated,1,B
TREATED_REP2,AEG588A2_S1_L003_R1_001.fastq.gz,AEG588A2_S1_L003_R2_001.fastq.gz,treated,2,A
TREATED_REP3,AEG588A2_S1_L004_R1_001.fastq.gz,AEG588A2_S1_L004_R2_001.fastq.gz,treated,3,B
```

## contrasts.csv    
```
id,variable,reference,target,blocking
condition_control_treated,condition,control,treated,
```
