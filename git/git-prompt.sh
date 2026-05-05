function __exit_status() {
    local EXIT_STATUS="$?" #Grab last command exit status
    if [ $EXIT_STATUS != 0 ]; then
        # change color to red background and black text
        echo -e '\e[41;30m'"$EXIT_STATUS"'\e[0;30m' # Print red x if command failed
        # echo -e '\e[0;31m'"x " # Print red x if command failed
    fi
}

# Array of colors for the bars
let GREEN=0
let YELLOW=1
let BLUE=2
let MAGENTA=3
let CYAN=4
let RED=5

# Array of background colors
backgrounds=(
    '\[\033[48;5;106m\]' # Green background (256 color, wow!)
    '\[\033[48;5;184m\]' # Yellow background (256 color, wow!)
    '\[\033[48;5;073m\]' # Blue background (256 color, wow!)
    '\[\033[48;5;135m\]' # Magenta background (256 color, wow!)
    '\[\033[48;5;087m\]' # Cyan background (256 color, wow!)
    '\[\033[48;5;196m\]' # Red background (256 color, wow!)
    '\[\033[49m\]' # Default background
)
# Array of text colors matching the background colors
text_color=(
    '\[\033[38;5;106m\]' # Green text
    '\[\033[38;5;184m\]' # Yellow text
    '\[\033[38;5;073m\]' # Blue text
    '\[\033[38;5;135m\]' # Magenta text
    '\[\033[38;5;087m\]' # Cyan text
    '\[\033[38;5;196m\]' # Red text
    '\[\033[39m\]' # Default text color
    '\[\033[30m\]' # Black text
)

function print_bar() {
    argc=$#
    argv=("$@")

    PS1="$PS1""${backgrounds[$1]}${text_color[7]}"
    for (( j=0; j<argc; j=j+2 )); do
        color=${argv[j]}
        text=${argv[j+1]}
        # if there are more parameteres, use the background color of the next one, otherwise use the default background color
        if [ $((j+2)) -lt $argc ]; then
            next_color=${argv[j+2]}
            next_background=${backgrounds[next_color]}
        else
            next_background=${backgrounds[6]} # Default background color
        fi
        PS1="$PS1""${backgrounds[color]}${text_color[7]}$text${text_color[color]}${next_background}"
    done
}

#PS1='\[\033]0;$PWD | Git Bash\007\]' # set window title
#PS1="$PS1"'\n'                 # new line

PS1='\n'                 # new line
PS1="$PS1"'`__exit_status`\n'

#PS1="$PS1"'\[\033[32m\]'       # change color to green
current_time=" \D{%H:%M:%S}"

# PS1="$PS1"'\[\033[32m\]'       # change to green
# PS1="$PS1"'\u@\h '             # user@host<space>
# PS1="$PS1"'\[\033[35m\]'       # change to purple
# PS1="$PS1"'$MSYSTEM '          # show MSYSTEM
#PS1="$PS1"'\[\033[33m\]\w'       # current working directory
working_dir="\w"

git_branch=""
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        #PS1="$PS1"'\[\033[36m\]'  # change color to cyan
        git_branch=" "'`__git_ps1`'   # bash function
    fi
fi

print_bar $GREEN "$current_time" $YELLOW "$working_dir" $BLUE "$git_branch" 

PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $
