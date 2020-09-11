Dotfiles
========

Settings repo for syncing configurations across Windows machines. Install script places Hard Links to each settings file at the locations specified in [install.sh](install.sh).

Limitations
-----------
 - Symlinks can only be created between files on the same disk. This means that the repo must be cloned to the same disk where the User directory is located.

Resources
---------
 - [Powerline enabled fonts](https://github.com/microsoft/cascadia-code/releases) for Windows Terminal
 - [Vundle](https://github.com/VundleVim/Vundle.vim) for vim

Usage
-----
 - Clone repo to the same disk as `~` / User directory
 - Run `./install.sh` from a git bash.
 - Say `y` to the files you want installed.
