
# Slurm script

```bash
#!/bin/bash -l
#SBATCH -J jobname
#SBATCH --time=4:00:00
#SBATCH -p batch
#SBATCH -n 1
#SBATCH --mem=10g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=email


module load nf-core/2.10 
module load nf-core-taxprofiler/1.1.6 


OUTDIR=/cluster/tufts/xli37/research/naz/analysis/Illumina_taxprofiler/out/
taxprofiler \
   -profile tufts \
   --input samplesheet.csv \
   --databases databases.csv \
   --outdir  ${OUTDIR} \
   --run_kraken2 --run_metaphlan \
   --kraken2_save_reads \
   --kraken2_save_readclassifications \
   --run_kaiju --run_diamond \
   -resume 
```

database.csv file
```
tool,db_name,db_params,db_path
kraken2,k2_minusb,,/cluster/tufts/biocontainers/datasets/kraken2/k2_minusb_20240112.tar.gz
bracken,db1,,/cluster/tufts/biocontainers/datasets/kraken2/k2_minusb_20240112.tar.gz
metaphlan,metaphlan3-db,,/cluster/tufts/biocontainers/datasets/nf-core/metaphlan
kaiju,db1,,/cluster/tufts/biocontainers/datasets/kaiju/kaiju_db_rvdb/
diamond,db1,,/cluster/tufts/bio/data/diamond/
```

samplesheet.csv
```
sample,run_accession,instrument_platform,fastq_1,fastq_2,fasta
Projectname,run1,ILLUMINA,file_R1_001.fastq.gz,file_R2_001.fastq.gz, 
```

# Databases
Kaiju database: `/cluster/tufts/biocontainers/datasets/kaiju/kaiju_db_rvdb/`         
You can also create your own database by:
```
wget https://kaiju.binf.ku.dk/database/kaiju_db_nr_2023-05-10.tgz
tar xzf kaiju_db_nr_2023-05-10.tgz
# Which will give you 3 files: 
# kaiju_db_nr.fmi
# nodes.dmp
# names.dmp
```

# Reference
A quick start for Kaiju: [LINK](https://github.com/bioinformatics-centre/kaiju/blob/master/Quickstart.md)

