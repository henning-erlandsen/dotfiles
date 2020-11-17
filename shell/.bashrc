alias python='winpty python'
alias py='winpty py'

alias g=git
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gba='git branch -a --list'
alias gc='git commit'
alias gcam='git commit -am'
alias gcb='git checkout -b'
alias gcmsg='git commit -m'
alias gd='git diff --ignore-submodules'
alias gdca='git diff --cached'
alias gf='git fetch --prune --prune-tags --recurse-submodules=on-demand'
alias gfb='git fetch origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gfo='git fetch origin'
alias gfom='git fetch origin main'
alias gout='git log -p @{u}...'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"'
alias grc='git rebase --continue'
alias grom='git rebase origin/main'
alias gs='git status --ignore-submodules'
alias gup='git pull origin "$(git rev-parse --abbrev-ref HEAD)" --rebase'
alias gbl="git for-each-ref --sort=-committerdate refs/heads/ --count=10 | sed 's/[a-z0-9]\{40\} commit\trefs\/heads\/\(.*\)/\1/'"

alias gen_win_ogl='cmake -T v141,host=x64 -DCMAKE_SYSTEM_ARCH=x64 -DGraphicsAPI=OGL -DBUILD_NAME=win32_ogl_x64 -DUNITY_BUILDS_ENABLED=ON'

export GIT_PS1_SHOWDIRTYSTATE=0

alias mine='cd /e/bedrock'
alias subl="'/c/Program Files/Sublime Text 2/sublime_text.exe'"


function validate
{
	shopt -s nullglob

	files=(build/win/*.sln)
	if [[ "${#files[@]}" -eq "1" ]]; then
		return 0
	else
		echo "Found multiple solution files after generating!"
		ls -lc build/win/*.sln
		return 1
	fi
}

function legen
{
    pushd handheld/project/VS2015/project_builder
    python make_vs_project.py
    popd
}

function query_submodule_update
{
	read -p "Update submodules? " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		git submodule update --init --recursive
	fi
}

function check_submodules
{
	git diff --no-ext-diff --quiet --ignore-submodules="none"
}

function pegen
{
	check_submodules || query_submodule_update
	cmake build/win
	validate
	return
}
PATH=$PATH:/d/scripts

