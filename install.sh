#!/bin/bash

function install {

    read -p "Install $1?" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        ./link.bat "$2" "$1"
    fi
}

install git/.gitconfig ~/.gitconfig
install git/git-prompt.sh ~/.config/git/git-prompt.sh
install .bashrc ~/.bashrc
install windows-terminal/settings.json ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json