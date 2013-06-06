###############
#  variables  #
###############
export AQUATERM_PATH=/Applications/AquaTerm.app
export JAVA_HOME=`/usr/libexec/java_home`

export CLICOLOR=1 # add some color to the bash shell
#export LSCOLORS=GxFxCxDxBxegedabagaced
#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export EDITOR="mate"
export PAGER="less"
export BROWSER="chrome"

# Setup ueber path
export UEBER_DIR=$HOME/src/ueber_mac

##################
# git completion #
##################

GIT_PS1_SHOWDIRTYSTATE=true
source ~/.git-completion.bash
source ~/.git-prompt.sh

#############
# Prompt    #
#############
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
ORANGE="\[\033[38;5;172m\]"

export PS1=$ORANGE'λ$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$GREEN": "

#############
#  aliases  #
#############

alias ll='ls -lah'
alias la='ls -a'
alias gg='git status -s'
alias du='du -h'
alias df='df -h'

#############
#   etc     #
#############

# Add path for macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# set up rvm - ruby version manager
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# set up QSTK directory for python and Computation Investment
. ~/QSTK/local.sh


