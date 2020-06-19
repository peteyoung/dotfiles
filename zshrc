####################
# Aliases          #
####################
alias src='cd $HOME/src'
alias ccat='/usr/local/share/python/pygmentize -g'
alias be='bundle exec'
alias t='tree -ACr .'
alias e=$EDITOR
alias psaux='ps aux | grep -v grep | grep'
alias ta='tmux attach -t'
alias ll='ls -lah'

####################
# Exports          #
####################
export TERM=xterm-256color
export UEBER_DIR=$HOME/src/ueber_mac

####################
# Path             #
####################
export PATH=/usr/local/bin:$PATH

####################
# Prompt           #
####################
autoload -U colors && colors
autoload -U promptinit &&  promptinit
autoload -U compinit && compinit
PROMPT="%{$fg[red]%}λ%{$fg[yellow]%}: %{$fg[green]%}"

####################
# Prezto Loading   #
####################
#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

###################
#      Ruby       #
###################

CHRUBY_SETUP_SCRIPT=/usr/local/opt/chruby/share/chruby/chruby.sh
if [[ -f $CHRUBY_SETUP_SCRIPT ]]
    then
        . $CHRUBY_SETUP_SCRIPT
        chruby 1.9.3-p429
fi

RVM_SETUP_SCRIPT=~/.rvm/scripts/rvm
if [[ -f $RVM_SETUP_SCRIPT ]]
    then
        . $RVM_SETUP_SCRIPT
        PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

###################
# color man pages #
###################
can() {
    env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

#################################################
# cd to current folder in focused finder window #
#################################################
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/peteyoung/.sdkman"
[[ -s "/Users/peteyoung/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/peteyoung/.sdkman/bin/sdkman-init.sh"
