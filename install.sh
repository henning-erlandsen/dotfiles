#!/bin/bash

function install {

    # Ask to install file
    read -p "Install $1? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Does the file already exist?
        if [[ -f "$2" ]]; then
            read -p "$2 already exists. Overwrite? " -n 1 -r
            echo
            # Move old file to .orig
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                mv "$2" "$2".orig
            else
                return
            fi
        fi

        DIR=${2%/*}
        mkdir --parents "$DIR"
        ./link.bat "$2" "$1"
    fi
}

install ./git/.gitconfig ~/.gitconfig
install ./git/git-prompt.sh ~/.config/git/git-prompt.sh
install .bashrc ~/.bashrc
install windows-terminal/settings.json ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
install resharper/GlobalSettingsStorage.DotSettings ~/AppData/Roaming/JetBrains/Shared/vAny/GlobalSettingsStorage.DotSettings
