#!/bin/bash
#SBATCH -J SJob
#SBATCH --time=00-12:00:00
#SBATCH -p batch
#SBATCH -n 2
#SBATCH --mem=8g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=xue.li37@tufts.edu
module load R/4.3.0


echo HELLO
