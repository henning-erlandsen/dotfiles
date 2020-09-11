alias python='winpty python'
alias py='winpty py'

alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a --list'
alias gc='git commit'
alias gcam='git commit -am'
alias gcb='git checkout -b'
alias gcmsg='git commit -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch --prune --prune-tags --recurse-submodules=on-demand'
alias gfb='git fetch origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gout='git log -p @{u}...'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"'
alias grc='git rebase --continue'
alias grom='git rebase origin/main'
alias gs='git status'
alias gup='git pull origin "$(git rev-parse --abbrev-ref HEAD)" --rebase'
alias gbl="git for-each-ref --sort=-committerdate refs/heads/ --count=10 | sed 's/[a-z0-9]\{40\} commit\trefs\/heads\/\(.*\)/\1/'"

export GIT_PS1_SHOWDIRTYSTATE=0

alias mine='cd /d/Minecraftpe'
alias subl="'/c/Program Files/Sublime Text 2/sublime_text.exe'"

function pegen()
{
	pushd $(git rev-parse --show-toplevel)/build_win32_dx11_x64_unity
	cmake ..
	popd
}

PATH=$PATH:/d/scripts

