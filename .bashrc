###############
#  variables  #
###############

case $(uname) in
# os x
Darwin*) 
     # JAVA_HOME
    export JAVA_HOME=$(/usr/libexec/java_home)
    export AQUATERM_PATH=/Applications/AquaTerm.app
    ;; 
esac

export EDITOR="emacs"
export PAGER="less"
export BROWSER="chrome"

# Setup ueber path
export UEBER_DIR=$HOME/src/sf/ueber_mac

##################
#   ls colors    #
##################

# http://geoff.greer.fm/lscolors/
# https://github.com/seebi/dircolors-solarized

case $(uname) in
Darwin*) # os x
    export CLICOLOR=1 
    alias ls='ls -G'
    export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
    ;; 
*) 
    alias ls='ls --color=auto'
    eval `dircolors ~/.dotfiles/dircolors.256dark`
    ;;
esac

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
RED="\[\033[31m\]"
WHITE="\[\033[0m\]"
PINK="\[\033[01;35m\]"

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
alias linode='ssh peteyoung@173.255.198.155'

#############
# functions #
#############

# mkdir and cd into it
function md () { mkdir -p "$@" && eval cd "\"\$$#\""; }

#############
#   etc     #
#############

# Add path for macports
[[ $(uname) == Darwin* ]] && export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# set up rvm - ruby version manager
[[ -s ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# set up QSTK directory for python and Computational Investment
[ -f ~/QSTK/local.sh ] && . ~/QSTK/local.sh


