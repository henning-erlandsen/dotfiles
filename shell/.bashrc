alias python='winpty python'
alias py='winpty py'

alias g=git
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gba='git branch -a --list'
alias gc='git commit'
alias gco='git checkout'
alias gcopom='git checkout -p origin/main'
alias gcp='git cherry-pick'
alias gcam='git commit -am'
alias gcb='git checkout -b'
alias gcmsg='git commit -m'
alias gd='git diff --ignore-submodules'
alias gdca='git diff --cached'
alias gf='git fetch --prune --prune-tags --recurse-submodules=on-demand'
alias gfb='git fetch origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gfo='git fetch origin'
alias gfom='git fetch origin main'
alias gfomm='git fetch origin main:main'
alias gout='git log -p @{u}...'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpsup='git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"'
alias grc='git rebase --continue'
alias grom='git rebase origin/main'
alias gs='git status --ignore-submodules'
alias gss='git status'
alias gup='git pull origin "$(git rev-parse --abbrev-ref HEAD)" --rebase'
alias gbl="git for-each-ref --sort=-committerdate refs/heads/ --count=10 | sed 's/[a-z0-9]\{40\} commit\trefs\/heads\/\(.*\)/\1/'"

alias gen_win_ogl='cmake -DUNITY_BUILDS_ENABLED=ON'

alias mine='cd /e/bedrock'
alias subl="'/c/Program Files/Sublime Text 2/sublime_text.exe'"

export GIT_PS1_SHOWDIRTYSTATE=0
export NDK_ROOT='C:/lib/android/android-ndk-r21c'
export ANDROID_SDK_ROOT='C:/Users/heeeland/AppData/Local/Android/Sdk'
export CMakeNuGetPackagePath='E:/temp/nuget'

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
	cmake --preset="win32_ogl_x64" -DUNITY_BUILDS_ENABLED=ON -DENABLED_LIVE_PP=ON $@
#	validate
	return
}
PATH=$PATH:/d/scripts:/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2019/Enterprise/Common7/IDE/CommonExtensions/Microsoft/CMake/Ninja/

