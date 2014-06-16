dotfiles
========

These are the dotfiles I like to have on all boxen/accounts. They're (hopefully) able to handle living on os x or linux.
Depends on [rcm][1] from [thoughtbot][2].

setup rcm
---------
__On a mac__

1. brew tap thoughtbot/formulae
2. brew install rcm
3. git clone git@github.com:peteyoung/dotfiles.git ~/.dotfiles
4. cp ~/.dotfiles/rcrc ~/.rcrc (nothing machine specific yet warranting a tag)
5. lsrc (double check config files)
6. rcdn -v
7. rcup -v

__On Arch__

NOTE: requires base-devel package group (provides fakeroot and strip)

1. curl -O "https://aur.archlinux.org/packages/rc/rcm/rcm.tar.gz"
2. tar -zxvf rcm.tar.gz 
3. cd rcm
4. makepkg -s
5. sudo pacman -U rcm-1.2.3-1-any.pkg.tar.xz

__In cygwin__

+ Be sure the following are installed
    - autoconf
    - automake
    - libtool

Run the following in cygterm

1. git clone https://github.com/thoughtbot/rcm.git
2. cd rcm
3. aclocal ; autoheader; automake --add-missing ; autoconf
4. ./configure ; make ; make install
5. cd ~
6. git clone https://github.com/peteyoung/dotfiles.git .dotfiles
7. cp ~/.dotfiles/rcrc ~/.rcrc
8. lsrc (double check config files)
9. rcdn -v
10. rcup -v

You can safely ignore AC_CONFIG_HEADERS error in #3 above

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
