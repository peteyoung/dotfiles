#!/bin/bash
############################
# makelinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# change to the dotfiles directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

# get dot files in dir
dotfiles=.[^.]*

# create symlinks from .dotfiles/ to ~ 
for file in $dotfiles; do

    [[ "$file" = ".git" ]] && continue
    [[ "$file" = ".gitignore" ]] && continue
    [[ "$file" = "README.md" ]] && continue
    [[ "$file" = *~ ]] && continue

    echo "symlinking $file"
    ln -fs $dir/$file ~/$file

done
