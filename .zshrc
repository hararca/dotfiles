# Function to determine which icon to display
function cwd_icon {
  if [ "$PWD" = "$HOME" ]; then
    echo " "
  else
    echo " "
  fi
}

# Function to parse the current git branch and determine the git service
function parse_git_info {
  if git rev-parse --is-inside-work-tree &> /dev/null; then
    local branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
    local remote_url=$(git config --get remote.origin.url)
    local service_icon=" " # Default icon

    if [[ $remote_url == *"gitlab.com"* ]]; then
      service_icon=" "
    elif [[ $remote_url == *"github.com"* ]]; then
      service_icon=" "
    fi
    echo " $branch $service_icon"
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
export PROMPT='󰚌 ${COLOR_DIR}$(cwd_icon)%~ ${COLOR_GIT}$(parse_git_info)
${COLOR_ARROW}󰁕 ${COLOR_INPUT}'

