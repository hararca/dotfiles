# Function to determine which icon to display
function cwd_icon {
    if [ "$PWD" = "$HOME" ]; then
        echo " "
    else
        echo " "
    fi
}

# Function to parse the current git branch
function parse_git_branch {
    if git rev-parse --is-inside-work-tree &> /dev/null; then
        echo " $(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')"
    fi
}

# Define colors
COLOR_DIR=$'%F{036}'
COLOR_GIT=$'%F{202}'
COLOR_ARROW=$'%F{129}'
COLOR_INPUT=$'%F{015}'

# Enable prompt substitution
setopt PROMPT_SUBST

# Set the custom prompt
export PROMPT='
󰚌 ${COLOR_DIR}$(cwd_icon)%~ ${COLOR_GIT}$(parse_git_branch)
${COLOR_ARROW}󰁕 ${COLOR_INPUT}'
