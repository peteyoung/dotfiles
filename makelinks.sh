#!/bin/bash
############################
# makelinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# change to the dotfiles directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

# files to exclude
#   http://www.bestsolution.at/en/03_Products-nbsp~--nbsp~Projects__13_exclude-nbsp~wildcard-nbsp~matches.html
#   https://www.gnu.org/software/bash/manual/html_node/Filename-Expansion.html
GLOBIGNORE=\.git:\.gitignore:*~:*.swp:README.md:dircolors.256dark:makelinks.sh:\.DS_Store

# create symlinks from .dotfiles/ to ~ 
for file in *; do

    echo "symlinking $file"
    ln -fs $dir/$file ~/.$file

done
