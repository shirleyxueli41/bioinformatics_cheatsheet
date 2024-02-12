## Set up alias
```shell
vi ~/.bashrc
# add the following text at the end
alias qstat='squeue -u xli37'
alias ish='srun -p interactive -n 1 --mem 8g --pty bash'
alias mod='cat /cluster/tufts/xli37/modules.txt'
# Then do this
source ~/.bashrc
```

## Have a modules.txt file to save time when module avail       
Since the command 'module avail' takes a while to load, we can just run it once and save all the available modules on a txt file.        
An example file is [here](https://github.com/shirleyxueli41/cheatsheet/blob/main/modules.txt).            
*Remember to update the modules.txt file once a while since we keep deploying new tools/pipelines*       
```shell
# set alias in .bashrc file
alias mod='cat /cluster/tufts/xli37/modules.txt'
# Then we can just do
mod
# This will show whatever inside the modules.txt file. 
```

## Header of script       
```
#!/usr/bin/env Rscript
#!/usr/bin/env python

#!/bin/bash
#SBATCH -J test
#SBATCH --time=00-02:00:00
#SBATCH -p batch
#SBATCH -n 2
#SBATCH --mem=2g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=xue.li37@tufts.edu
```

test GPC       
```
#!/bin/bash
#SBATCH -J SJob
#SBATCH --time=00-1:00:00
#SABTCH -p gpu
#SABTCH --gres=gpu:2
#SABTCH -n 2
#SABTCH --mem=8g
#SABTCH --output=MyJob.%j.%N.out
#SABTCH --error=MyJob.%j.%N.err
#SABTCH --mail-type=ALL
#SABTCH --mail-user=xue.li37@tufts.edu
module load R/4.3.0
module load anaconda/2023.07

echo hello
```
