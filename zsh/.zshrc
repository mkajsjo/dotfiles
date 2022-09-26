
source $HOME/.xprofile

#
# PATHS
#

export ZSH=$HOME/.config/zsh
export ZSH_COMPDUMP=$HOME/.zcompdump

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

# General
setopt AUTO_PARAM_SLASH         # tab completion of directory appends a slash
setopt NO_FLOW_CONTROL          # disable start (C-s) and stop (C-q) characters
setopt IGNORE_EOF               # [default] prevent accidental C-d from exiting shell
setopt LIST_PACKED              # make completion lists more densely packed
setopt MENU_COMPLETE            # auto-insert first possible ambiguous completion
setopt NO_BEEP                  # don't beep

# cd
setopt AUTO_CD                  # can omit cd
setopt AUTO_PUSHD               # Make cd push the old directory to the directory stack
setopt PUSHD_IGNORE_DUPS        # Make pushd ignore duplicate directories
setopt CD_SILENT                # Never print the working directory after a cd

# history
setopt APPEND_HISTORY           # append to history instead of replacing it
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt HIST_IGNORE_SPACE        # don't record commands starting with a space
setopt SHARE_HISTORY            # share history across shells
HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=9999

# Direct cd to projects from anywhere
cdpath=($HOME/dev)

# Changes timeout for entering vi mode from 0.4s to 0.1s (can affect other commands).
export KEYTIMEOUT=1

#
# KEYBINDS
#

# Vi mode
bindkey -v

# autocompletion using arrow keys (based on history)
bindkey "^[OA" history-search-backward
bindkey "^[OB" history-search-forward
bindkey -M vicmd "k" history-search-backward
bindkey -M vicmd "j" history-search-forward

#
# ALIAS
#

# Load completion
autoload -Uz compinit
compinit -d $ZSH_COMPDUMP

alias ls='ls --color=auto'
alias init="init.sh"
alias v=nvim

# Git
alias gd='git diff'
compdef _git gd=git-diff
alias gst='git status'
compdef _git gst=git-status
alias gss='git status -s'
compdef _git gss=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gp='git push'
compdef _git gp=git-push
alias gc='git commit'
compdef _git gc=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcom='git checkout master'
alias gcop='git checkout production'
alias gcor='git checkout release-train'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log'
compdef _git glg=git-log
alias glgs='git log --stat'
compdef _git glgs=git-log
alias ga='git add'
compdef _git ga=git-add
alias gstp='git stash pop'
compdef _git gstp=git-stash-pop

# cd
alias -g ...='../..'
alias -g ....='../../..'

alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

#
# MISC
#

# List previous directories
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/prompt.zsh

