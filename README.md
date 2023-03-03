dotfiles
========
These are the dotfiles I like to have on all boxes and accounts. They're (hopefully) able to handle living on macOS or linux.

setup dotfiles
--------------
run `~/.dotfiles/makelinks.sh`

git-prompt note
---------
`git-completion.bash`, `git-completion.zsh`, and `git-prompt.sh` can be found in [the git repo](https://github.com/git/git/tree/master/contrib/completion).
`git` currently doesn't allow sparse checkouts in a submodule, so it's a manual thing.

I use the [`git-completion/fetch-git-completion-files.sh`](https://github.com/peteyoung/dotfiles/blob/master/git-completion/fetch-git-completion-files.sh) script for convenience to download the most recent versions from master.

