# ~/.bashrc: executed by bash(1) for non-login shells.

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTFILESIZE=1000000
export HISTSIZE=100000
export HISTCONTROL=ignorespace
export HISTIGNORE='ls:history:ll'
export HISTTIMEFORMAT='%F %T '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

 
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


## Michael get current git branch name
source ~/.git-prompt.sh
usercolor='\[\e[1;33m\]'
#usercolor='[0;31m'
cwdcolor='\[\e[1;34m\]'
#cwdcolor='[0;34m'
gitcolor='\[\e[1;31m\]'
inputcolor='\[\e[0m\]'
#inputcolor='[0;37m'
export PS1=${usercolor}'\u@\h'${inputcolor}': '${cwdcolor}'\w'${gitcolor}'$(__git_ps1 "(%s)")'${inputcolor}'\$ '
#export PS1='\u \[\e'${cwdcolor}'\]\w\[\e'${gitcolor}'\]$(__git_ps1 " (%s)")\[\e'${inputcolor}'\]\$ '
#export PS1='\[\e'${cwdcolor}'\]\w\[\e'${gitcolor}'\]$(__git_ps1 " (%s)")\[\e'${inputcolor}'\]\$ '
#export PS1='\[\e[0;33m\]\u   \[\e[0m\]@ \[\e[0;32m\]\h \[\e[0m\]:\[\e[0;34m\]\w                                  \[\e[0m\]\$ '

unset inputcolor cwdcolor gitcolor usercolor   

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# python
# Set Anaconda Paths (in your ~/.bashrc)
#export CONDA_ROOT="/usr/local/anaconda"
#export PATH=$CONDA_ROOT/bin:$PATH
#export CONDA_ENVS_PATH=/raid3/gou/anaconda/envs:$CONDA_ROOT/envs
#source activate py3



#export LD_LIBRARY_PATH=/opt/local/lib:/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=~/local/lib${LD_RUN_PATH:+:$LD_RUN_PATH}
export LD_LIBRARY_PATH=~/local/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export PATH=~/local/bin${PATH:+:$PATH}
export CPATH=~/local/include${CPATH:+:$CPATH}
export C_INCLUDE_PATH=~/local/include${C_INCLUDE_PATH:+:$C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=~/local/include${CPLUS_INCLUDE_PATH:+:$CPLUS_INCLUDE_PATH}
export OBJC_INCLUDE_PATH=~/local/include${OBJC_INCLUDE_PATH:+:$OBJC_INCLUDE_PATH}
