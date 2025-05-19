
source $HOME/.xprofile

#
# PATHS
#

export ZSH=$HOME/.config/zsh
export ZSH_COMPDUMP=$HOME/.zcompdump
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

fpath=(
    $HOME/dev/dotfiles/zsh/funs
    $HOME/.pyenv/version
    $fpath
)

path=(
    $HOME/.config/composer/vendor/bin
    $HOME/.cargo/bin
    $HOME/bin
    $HOME/.dotnet
    $HOME/.dotnet/tools
    $HOME/.local/bin
    $path
)

#
# AUTOLOADS
#

# My custom functions
autoload -U $fpath[1]/*(:t)

# history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# tab completion
autoload -Uz compinit
compinit -d $ZSH_COMPDUMP

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
unsetopt IGNORE_EOF             # close zsh when closing tmux split

# cd
setopt AUTO_CD                  # can omit cd
setopt AUTO_PUSHD               # Make cd push the old directory to the directory stack
setopt PUSHD_IGNORE_DUPS        # Make pushd ignore duplicate directories
setopt CD_SILENT                # Never print the working directory after a cd

# history
setopt APPEND_HISTORY           # append to history instead of replacing it
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS        # omit older duplicates of newer commands
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt HIST_IGNORE_SPACE        # don't record commands starting with a space
setopt SHARE_HISTORY            # share history across shells
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Direct cd to projects from anywhere
cdpath=($HOME/dev)

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Changes timeout for entering vi mode from 0.4s to 0.1s (can affect other commands).
export KEYTIMEOUT=1

#
# KEYBINDS
#

# Vi mode
bindkey -v

# autocompletion using arrow keys (based on history)
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

#
# ALIAS
#

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
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
compdef _git gpsup=git-push

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

alias cap='cd ~/dev/Captario-SUM'
alias mod='cd ~/dev/Captario-SUM/module-modeling'
alias modsrc='cd ~/dev/Captario-SUM/module-modeling/src/modeling-api'
alias cli='cd ~/dev/Captario-SUM/client/packages/dimensional-modeling'

#
# MISC
#

# .Net
export DOTNET_ROOT=$HOME/.dotnet

# cd on nnn exit
nnn_cd()
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi
}
trap nnn_cd EXIT

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
export FZF_DEFAULT_OPTS='--height 50% --reverse'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/prompt.zsh

export DOCKER_BUILDKIT=1

# Open tmux if not already in tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Fix so that I don't forget to start minikube with enough resources.
minikube() {
  if [[ "$1" == "start" ]]; then
    command minikube start --cpus 14 --memory 16384 --extra-config=kubelet.serialize-image-pulls=false "${@:2}"
  else
    command minikube "$@"
  fi
}

# Hack to make dotnet output more readable
dotnet() {
    if [[ -e "/home/mkajsjo/dev/wrap-dotnet/bin/Release/net9.0/wrap-dotnet" ]]; then
        command /home/mkajsjo/dev/wrap-dotnet/bin/Release/net9.0/wrap-dotnet "$@"
    else
        command dotnet "$@"
    fi
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/share/../bin/env"
