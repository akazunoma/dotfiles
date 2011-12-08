# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size
shopt -s checkwinsize

# editor
export EDITOR="emacsclient"
export GIT_EDITOR="emacsclient"

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

# enable color support
alias grep='grep --color=auto --exclude=*.svn* --exclude=*.git*'
alias fgrep='fgrep --color=auto --exclude=*.svn* --exclude=*.git*'
alias egrep='egrep --color=auto --exclude=*.svn* --exclude=*.git*'

# other aliases
alias ..="cd .."
alias r="rails"
alias p="padrino"
alias s="screen"
alias e="emacs"
alias emacsclient="emacsclient -n"
alias ec="emacsclient"
alias g="git"
alias gi="git"
alias gt="git"
alias gti="git"
alias less="less -R"
alias pyserver='python -m SimpleHTTPServer > /dev/null 2>&1 &'
alias diff="colordiff --side-by-side --suppress-common-lines --ignore-tab-expansion --ignore-space-change"
alias df="df -h"
alias pwcopy="pwd | perl -pe 's/\n//' | pbcopy"

# rsense
export RSENSE_HOME="$HOME/.emacs.d/elisp/rsense"

# ignore
export FIGNORE=".svn"
