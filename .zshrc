####################
# Aliases          #
####################
alias src='cd $HOME/src'
alias ccat='/usr/local/share/python/pygmentize -g'
alias be='bundle exec'
alias t='tree -ACr .'
alias e=$EDITOR
alias psg='ps aux | grep -v grep | grep'
alias ta='tmux attach -t'
alias ll='ls -lah'

####################
# Exports          #
####################
export TERM=xterm-256color
export UEBER_DIR=$HOME/src/ueber_mac
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

####################
# Path             #
####################
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
# ls color settings
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

####################
# Colors           #
####################
#autoload -U colors && colors
#MAGENTA="\[\033[0;35m\]"
#YELLOW="\[\033[0;33m\]"
#BLUE="\[\033[34m\]"
#CYAN="\[\033[0;36m\]"
#GREEN="\[\033[0;32m\]"
#ORANGE="\[\e[38;5;172m\]"
#SOMETHING="%{\e[0;31m%}%m%{\e[0m%}"

####################
# Git Completion   #
####################
#GIT_PS1_SHOWDIRTYSTATE=true
#source ~/.git-completion.bash
#source ~/.git-prompt.sh

####################
# Prompt           #
####################
export PS1='λ: ' 

####################
# Prezto Loading   #
####################
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

