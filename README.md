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
An example file is here.            
*Remember to update the modules.txt file once a while since we keep deploying new tools/pipelines*       
```shell
# set alias
alias mod='cat /cluster/tufts/xli37/modules.txt'
# Then we can just do
mod
# This will show whatever inside the modules.txt file. 
```
