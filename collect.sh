#!/bin/bash

function collect {

    # Ask to install file
    read -p "Collect $2? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        # Does the file already exist?
        if [[ -f "$2" ]]; then
            cp "$2" "$1"
        else
            echo "File does not exist: $2"
        fi
    fi
}

collect git/.gitconfig ~/.gitconfig
collect git/git-prompt.sh ~/.config/git/git-prompt.sh
collect shell/.bashrc ~/.bashrc
collect windows-terminal/settings.json ~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
collect resharper/GlobalSettingsStorage.DotSettings ~/AppData/Roaming/JetBrains/Shared/vAny/GlobalSettingsStorage.DotSettings
collect vim/.vimrc ~/.vimrc
