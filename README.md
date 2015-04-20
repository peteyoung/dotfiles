dotfiles
========

These are the dotfiles I like to have on all boxen/accounts. They're (hopefully) able to handle living on os x or linux.

setup dotfiles
--------------
run ~/.dotfiles/makelinks.sh

setup vim
---------
.vim is setup to use vundle. To get that bootstrapped, run the following commands.
```bash
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
```
