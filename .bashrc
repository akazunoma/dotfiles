# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size
shopt -s checkwinsize

# editor
export EDITOR="emacsclient"
export GIT_EDITOR="vim"

# git
source "$DOTFILES/.git-completion.bash"

# history
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL="ignoredups"
shopt -s histappend

# some more ls aliases
alias ls="ls -G"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# other aliases
alias ..="cd .."
alias s="screen"
alias e="emacs"
alias emacsclient="emacsclient -n"
alias ec="emacsclient"
alias g="git"
alias gi="git"
alias gt="git"
alias gti="git"
alias less="less -R"
alias diff="colordiff --side-by-side --suppress-common-lines --ignore-tab-expansion --ignore-space-change"
alias df="df -h"

# readline bind
bind -x '"\C-x\C-e": emacs'
bind '"\e\C-f": forward-word'
bind '"\e\C-b": backward-word'

# dropbox
DROPBOX_HOME="$HOME/dropbox"
export PATH="$PATH:$DROPBOX_HOME/bin"

# rsense
export RSENSE_HOME="$HOME/.emacs.d/elisp/rsense"
