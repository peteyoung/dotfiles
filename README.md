dotfiles
========

These are the dotfiles I like to have on all boxen/accounts. They're (hopefully) able to handle living on os x or linux.
Depends on [rcm][1] from [thoughtbot][2].

setup rcm
---------
On a mac

1. brew tap thoughtbot/formulae
2. brew install rcm
3. checkout this repo into ~/.dotfiles
4. cp ~/.dotfiles/rcrc ~/.rcrc (nothing machine specific yet warranting a tag)
5. lsrc (double check config files)
6. rcdn -v
7. rcup -v

setup vim
---------
.vim is setup to use vundle. To get that bootstrapped, run the following commands.
```bash
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```


[1]: http://thoughtbot.github.io/rcm/rcm.7.html "rcm manpage"
[2]: http://robots.thoughtbot.com/rcm-for-rc-files-in-dotfiles-repos "rcm blog post"
