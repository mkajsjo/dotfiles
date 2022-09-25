
source $HOME/.xprofile

#
# PATHS
#

export ZSH=$HOME/.config/zsh

fpath=(
    $HOME/dev/dotfiles/zsh
    $fpath
)

path=(
    $HOME/.config/composer/vendor/bin
    $HOME/bin
    $path
)

#
# SETTINGS
#

setopt AUTO_CD                  # can omit cd
setopt AUTO_PARAM_SLASH         # tab completion of directory appends a slash
setopt NO_FLOW_CONTROL          # disable start (C-s) and stop (C-q) characters
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt HIST_IGNORE_SPACE        # don't record commands starting with a space
setopt IGNORE_EOF               # [default] prevent accidental C-d from exiting shell
setopt LIST_PACKED              # make completion lists more densely packed
setopt SHARE_HISTORY            # share history across shells
setopt MENU_COMPLETE            # auto-insert first possible ambiguous completion

# Direct cd to projects from anywhere
cdpath=($HOME/dev)

# Changes timeout for entering vi mode from 0.4s to 0.1s (can affect other commands).
export KEYTIMEOUT=1

#
# KEYBINDS
#

# Vi mode
bindkey -v

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

#
# ALIAS
#

alias init="init.sh"
alias v=nvim

#
# MISC
#

source $ZSH/prompt.zsh
