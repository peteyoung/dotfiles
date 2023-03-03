####################
# Aliases          #
####################

alias src='cd $HOME/src'
alias t='tree -ACr .'

alias hl='history | sed -e '"'"'s/^\[ \\t\]\*//'"'"' | sort -rn | less'

#alias ccat='/usr/local/share/python/pygmentize -g'
#alias ccat='highlight -O ansi'

#alias ta='tmux attach -t'

#################
#  git aliases  #
#################

alias gg='git status -s'
alias gdiff='git diff --no-ext-diff'
alias gwdiff='git diff --no-ext-diff --word-diff=color'
alias gs='git status'
alias ga='git add'
alias gc='git commit'

####################
# Exports          #
####################

export TERM=xterm-256color

####################
# Prompt           #
####################

# zsh prompt colors: 
# See one of the following for color codes:
# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Misc/colors
# https://opensource.apple.com/source/zsh/zsh-87/zsh/Functions/Misc/colors.auto.html
autoload -U colors && colors

# Pre-rolled zsh prompts. Use `prompt -p` to see them. `prompt --help` for more info
# https://sourceforge.net/p/zsh/code/ci/master/tree/Functions/Prompts/promptinit
# https://opensource.apple.com/source/zsh/zsh-87/zsh/Functions/Prompts/promptinit
# https://opensource.apple.com/source/zsh/zsh-87/zsh/Functions/Prompts/promptinit.auto.html
#autoload -U promptinit &&  promptinit

# zsh tab completion
# https://sourceforge.net/p/zsh/code/ci/master/tree/Completion/compinit
# https://opensource.apple.com/source/zsh/zsh-87/zsh/Completion/compinit.auto.html
autoload -U compinit && compinit

#PROMPT="⚡️ %{$fg[yellow]%}"

#############
# functions #
#############

# mkdir and cd into it
function md () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# pretty print $PATH
function path () { echo "${PATH}" | tr : '\n'; }

# function to display all color combos
function showColors {
 for STYLE in 0 1 2 3 4 5 6 7; do
   for FG in 30 31 32 33 34 35 36 37; do
     for BG in 40 41 42 43 44 45 46 47; do
       CTRL="\033[${STYLE};${FG};${BG}m"
       echo -en "${CTRL}"
       echo -n "${STYLE};${FG};${BG}"
       echo -en "\033[0m"
     done
     echo
   done
   echo
 done
}

# GUI man page reader on macOS
case $(uname -s) in
  Darwin)
    function gman () {
      man -t $1 | open -a /System/Applications/Preview.app -f
    }
    ;;
esac

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

#############################
# git completion and prompt #
#############################

GIT_PS1_SHOWDIRTYSTATE=true
zstyle ':completion:*:*:git:*' script ~/.dotfiles/git-completion/git-completion.bash
fpath=(~/.dotfiles/git-completion/ $fpath)

source ~/.dotfiles/git-completion/git-prompt.sh
precmd () { __git_ps1 "%n" ":%~ ⚡️ " "|%s" }

####################
#  Local Settings  #
####################

[[ -f ~/.zsh_local ]] && . ~/.zsh_local

####################
# Path             #
####################

export PATH=/usr/local/bin:$PATH
