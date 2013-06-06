#!/bin/bash
############################
# makelinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# change to the dotfiles directory
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $dir

# get collection of files in dir
dotfiles=.[^.]*

# create symlinks from .dotfiles/ to ~ 
for file in $dotfiles; do
    if [ "$file" != ".git" ] 
    then
	echo "symlinking $file"
	ln -s $dir/$file ~/.$file
    fi
done
