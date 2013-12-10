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
Linux)
    export TERM=xterm-256color
    ;;
esac

export EDITOR="vim"
export PAGER="less"
export BROWSER="chrome"

####################
#  Local Settings  #
####################

[[ -f ~/.bash_local ]] && . ~/.bash_local

##################
#   ls colors    #
##################

# http://geoff.greer.fm/lscolors/
# https://github.com/seebi/dircolors-solarized

case $(uname) in
Darwin*) # os x
    export CLICOLOR=1
    alias ls='ls -G'

    # OS X default
    export LSCOLORS="exfxcxdxbxegedabagacad"

    # Linux default (looks terrible solarized)
    #export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

    ;;
*)
    alias ls='ls --color=auto'
    eval `dircolors ~/.dotfiles/dircolors.256dark`
    ;;
esac

##############
# man colors #
##############

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[32m'          #$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[36m'          #$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;31;5;146m' # begin underline

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
alias psaux='ps aux | grep -v grep | grep '
alias ec='emacsclient'
alias eckill='emacsclient -e "(kill-emacs)"'
alias remacs='find . -name "*~" -print0 | xargs -0 rm'
alias linode='ssh peteyoung@173.255.198.155'
alias bc='bc -q'

#############
# functions #
#############

# mkdir and cd into it
function md () { mkdir -p "$@" && eval cd "\"\$$#\""; }

#############
#   etc     #
#############

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

###################
#    Homebrew     #
###################

PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH

###################
#      Ruby       #
###################

CHRUBY_SETUP_SCRIPT=/usr/local/opt/chruby/share/chruby/chruby.sh
if [[ -f $CHRUBY_SETUP_SCRIPT ]] &&
   [[ -s $CHRUBY_SETUP_SCRIPT ]]
    then
        . $CHRUBY_SETUP_SCRIPT
        export RUBIES=(/opt/rubies/*)
        chruby 1.9.3-p429
fi

RVM_SETUP_SCRIPT=~/.rvm/scripts/rvm
if [[ -f $RVM_SETUP_SCRIPT ]] &&
   [[ -s $RVM_SETUP_SCRIPT ]]
    then
        . $RVM_SETUP_SCRIPT
        PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

###################
# psql prettifier #
###################
ppsql() {
  TEMP_LESS=$LESS
  TEMP_PAGER=$PAGER

  PSQL_YELLOW=$(printf "\e[1;33m")
  PSQL_LIGHT_CYAN=$(printf "\e[1;36m")
  PSQL_NOCOLOR=$(printf "\e[0m")

  export LESS="-iMSx4 -FXR"

  PAGER="sed \"s/\([[:space:]]\+[0-9.\-]\+\)$/${PSQL_LIGHT_CYAN}\1$PSQL_NOCOLOR/;"
  PAGER+="s/\([[:space:]]\+[0-9.\-]\+[[:space:]]\)/${PSQL_LIGHT_CYAN}\1$PSQL_NOCOLOR/g;"
  PAGER+="s/|/$PSQL_YELLOW|$PSQL_NOCOLOR/g;s/^\([-+]\+\)/$PSQL_YELLOW\1$PSQL_NOCOLOR/\" 2>/dev/null  | less"
  export PAGER

  env psql "$@"

  [[ -z "$TEMP_LESS" ]] && unset LESS || export LESS=$TEMP_LESS
  [[ -z "$TEMP_PAGER" ]] && unset PAGER || export LESS=$TEMP_PAGER
  #unset LESS PAGER
}


###############
# export PATH #
###############
export PATH
