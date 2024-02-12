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

