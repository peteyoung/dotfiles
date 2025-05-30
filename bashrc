###############
#  variables  #
###############
export TERM=xterm-256color
export EDITOR="nvim"
export PAGER="less"
export BROWSER="brave"


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


#############
#  aliases  #
#############
alias du='du -h'
alias df='df -h'
alias psaux='ps aux | grep -v grep | grep '
alias hl='history | sed -e '"'"'s/^\[ \\t\]\*//'"'"' | sort -rn | less'


#################
#  git aliases  #
#################
alias gg='git status -s'
alias gdiff='git diff --no-ext-diff'
alias gwdiff='git diff --no-ext-diff --word-diff=color'
alias gs='git status'
alias ga='git add'
alias gc='git commit'


##########
#   bc   #
##########
# http://superuser.com/questions/84949/dividing-with-gnus-bc
export BC_ENV_ARGS="-q $HOME/.bcrc"


#############
# functions #
#############
# mkdir and cd into it
function md () {
  mkdir -p "$@" && eval cd "\"\$$#\"";
}

# pretty print $PATH
function path () {
  echo "${PATH}" | tr ':' '\n';
}

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

# psql prettifier
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


####################
#  Local Settings  #
####################
[[ -f ~/.bash_local ]] && . ~/.bash_local


###############
# export PATH #
###############
export PATH
