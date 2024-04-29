#SBATCH -p batch
#SBATCH -n 2
#SBATCH --mem=50G
#SBATCH --output=MyJob.%j.out
#SBATCH --error=MyJob.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=name@tufts.edu

