# Modules on Tufts HPC Cluster



### What are modules?

- A tool that **simplify** shell initialization and lets users easily modify their environment during the session with modulefiles

- Each modulefile contains the **information** needed to configure the shell for an application. (PATH, LD_LIBRARY_PATH, CPATH, etc.)

- Modules are useful in managing **different versions** of applications. 

- Modules can also be bundled into metamodules that will load an entire **set of different applications**. 

### How to use modules?

> **Module Cheat Sheet**
>
> `module av`
>
> `module av <software>`
>
> `module list`
>
> `module load <software>`
>
> `module unload <software>`
>
> `module swap <loaded_software> <new_software>`
>
> `module purge`

To **check available modules** installed on the cluster:

```
[tutln01@login-prod-01 ~]$ module av
```

Upon login, environment variable **`PATH`** is set for the system to search executables along these paths:

```
[tutln01@login-prod-01 ~]$ echo $PATH
/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/cluster/home/tutln01/bin:/cluster/home/tutln01/.local/bin
```

For example, I would like to use `gcc` compiler, to check what versions of gcc compiler is available, load the version I would like to use, and use it:

```
[tutln01@login-prod-01 ~]$ module av gcc

----------------------------------------------------------- /opt/shared/Modules/modulefiles-rhel6 ------------------------------------------------------------
gcc/4.7.0 gcc/4.9.2 gcc/5.3.0 gcc/7.3.0

-------------------------------------------------------------- /cluster/tufts/hpc/tools/module ---------------------------------------------------------------
gcc/8.4.0 gcc/9.3.0 gcc/11.2.0
```

Use `module list` to **check loaded modules** in current environment:

```
[tutln01@login-prod-01 ~]$ module load gcc/7.3.0
[tutln01@login-prod-01 ~]$ module list
Currently Loaded Modulefiles:
  1) use.own     2) gcc/7.3.0
```

```
[tutln01@login-prod-01 ~]$ which gcc
/opt/shared/gcc/7.3.0/bin/gcc
[tutln01@login-prod-01 ~]$ echo $PATH
/opt/shared/gcc/7.3.0/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/cluster/home/tutln01/bin:/cluster/home/tutln01/.local/bin
[tutln01@login-prod-01 ~]$ gcc --version
gcc (GCC) 7.3.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

**swap a module for another** (doesn't have to be the same software):

```
[tutln01@login-prod-01 ~]$ module swap gcc/7.3.0 gcc/9.3.0 
[tutln01@login-prod-01 ~]$ module list
Currently Loaded Modulefiles:
  1) use.own     2) gcc/9.3.0
```

 **unload loaded modules**:

```
[tutln01@login-prod-01 ~]$ module unload gcc
[tutln01@login-prod-01 ~]$ echo $PATH
/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/cluster/home/tutln01/bin:/cluster/home/tutln01/.local/bin
```

**unload ALL** of the loaded modules:

```
[tutln01@login-prod-01 ~]$ module purge
```



### Private Modules

Here is how to create [Private Modules](https://tufts.box.com/s/fewt978g2hmmmhskm1n5dg4bj6xt0cdd) after you installed software locally for yourself.