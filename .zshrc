# It needs a nerd font to properly display the icons
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p'
}

COLOR_DEF=$'%f'
COLOR_DIR=$'%F{036}'
COLOR_GIT=$'%F{202}'
COLOR_ARROW=$'%F{129}'
COLOR_INPUT=$'%F{015}'
setopt PROMPT_SUBST
export PROMPT='󰚌 ${COLOR_DIR} %~ ${COLOR_GIT}  $(parse_git_branch)${COLOR_DEF}'$'\n''${COLOR_ARROW}󰁕 ${COLOR_INPUT}'
