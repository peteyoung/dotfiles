# Setup ueber path
export UEBER_DIR=$HOME/src/ueber_mac

# Alias some colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
ORANGE="\[\033[38;5;172m\]"

GIT_PS1_SHOWDIRTYSTATE=true

export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

##### Setup prompt with lambda and git status #####
export PS1=$ORANGE'λ$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$GREEN": "

##### Aliases #####
alias ll='ls -lah'
alias la='ls -a'
alias gg='git status -s'

##### Setup git completion #####
source ~/.git-completion.bash
source ~/.git-prompt.sh
