# Cheatsheet for Linux Tricks
Author: Shirley Li       
Created: 2024-01      
Updated: 2024-05      
Email: xue.li37@tufts.edu


## 1. Set up alias
```bash
cd
vi ~/.bashrc

# add the following text at the end
alias qstat='squeue -u xli37'  
alias ish='srun -p interactive -n 1 --time=04:00:00 --mem 20g --pty bash'     
alias ishgpu='srun -p preempt -n 1 --time=04:00:00 --mem=20G --gres=gpu:1 --pty /bin/bash'
alias hpc='module load hpctools'        
alias free='df -h  /cluster/tufts/xli37'      
alias mod='cat /cluster/tufts/xli37/modules.txt'

# Then do this
source ~/.bashrc
```


## 2. Have a modules.txt file to save time when module avail       
Since the command 'module avail' takes a while to load, we can just run it once and save all the available modules on a txt file.        
An example file is [here](https://github.com/shirleyxueli41/cheatsheet/blob/main/modules.txt).    
       
*Remember to update the modules.txt file once a while since we keep deploying new tools/pipelines*       

```bash
# set alias in .bashrc file
alias mod='cat /cluster/tufts/xli37/modules.txt'

# Then we can just do
mod
# This will show whatever inside the modules.txt file. 
```

## 3. Header of script     
### Bash script        
```
#!/bin/bash
#SBATCH -J test
#SBATCH --time=02:00:00
#SBATCH -p batch
#SBATCH -n 2
#SBATCH --mem=2g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=xue.li37@tufts.edu
```

If `#!/bin/bash` doesn't work, try `#!/bin/bash -l`       

`#!/bin/bash -l`: Adding the `-l` option (--login) instructs Bash to start a login shell. This means that it will behave as if you logged in interactively, reading the relevant initialization files such as `.bash_profile`, `.bashrc`, etc. This can be useful if your script relies on environment variables or settings configured in these files. It ensures that the script has the same environment as if you were running commands directly in an interactive shell session.


### Bash script with GPU     
```
#!/bin/bash
#SBATCH -J GPU_Job
#SBATCH --time=01:00:00
#SBATCH -p gpu
#SBATCH --gres=gpu:a100:1
#SBATCH -n 2
#SBATCH --mem=8g
#SBATCH --output=MyJob.%j.%N.out
#SBATCH --error=MyJob.%j.%N.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=xue.li37@tufts.edu
nvidia-smi   
# Always use this command to display a summary of information about the GPUs installed on your system. 
# If you are not using this command, try to `sleep 5` to give the system enough time to mount tools, otherwise `module load` may not work.  

```      
GPU can also be set to `preempt` which will dequeue faster, but have a risk of being cancelled before completed. 
```
#SBATCH -p preempt
```



### Python script
```python
#!/usr/bin/env python
```

### R script
```r
#!/usr/bin/env Rscript
```

## 4. How to Create Custom Bash Script Header Template File
First start by creating the template file called sh_header.temp, which contains your custom
bash script header, possibly under `~/.vim/` directory under your home.
```bash
cd
vi ~/.vim/sh_header.temp
```

Next add the following lines in it (feel free to set your own template file location and custom
header) and save the file.       
```
#!/bin/bash
# Script Name:
# Description:
# Args:
# Author:
# Email: 
```


Configure autocmd in Vimrc File
Now open your vim initialization file `~/.vimrc` for editing and add the following line to it.
```bash
au bufnewfile *.sh 0r /home/name/.vim/sh_header.temp
```

> Where:        
> au – means autocmd      
> bufnewfile – event for opening a file that doesn’t exist for editing.      
> *.sh – consider all files with .sh extension.      


So the above line instructs vi/vim editor to read the contents of the template file
(/home/name/.vim/sh_header.temp) and insert it into every new .sh file opened by a
user.

