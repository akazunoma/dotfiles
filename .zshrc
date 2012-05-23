## env
export LANG=ja_JP.UTF-8

## color
autoload -Uz colors
colors

local reset="%{${reset_color}%}"
local green="%{${fg[green]}%}"
local blue="%{${fg[blue]}%}"
local red="%{${fg[red]}%}"
local cyan="%{${fg[cyan]}%}"
local white="%{${fg[white]}%}"
local base_color=""

case $OSTYPE in
darwin*)
  base_color=$cyan
  ;;
*)
  base_color=$green
  ;;
esac

## prompt
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn cvs
zstyle ':vcs_info:*' formats '(%s) - [%b]'
zstyle ':vcs_info:*' actionformats '(%s)- [%b|%a]'

function _update_rprompt() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
      psvar[1]="$vcs_info_msg_0_"
    fi
    if which rvm-prompt &> /dev/null; then
      psvar[2]="$(rvm-prompt i v g)"
    fi
}
add-zsh-hook precmd _update_rprompt

local vcs="%1(v|${green} %1v${reset}|)"
local rvm="%2(v| ${red}(%2v)${reset}|)"

PROMPT="${base_color}%n@%m${white}:${blue}%~${white}$ "
PROMPT2="${white}> "
SPROMPT="%r is correct [n,y,a,e]? "
RPROMPT="${vcs}${rvm}"

## history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt hist_ignore_all_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt hist_no_store

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

## bind
bindkey -e
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

## completion
autoload -U compinit
compinit -u

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt correct_all
setopt list_packed
setopt list_types
setopt auto_list
setopt magic_equal_subst
setopt auto_param_keys
setopt auto_param_slash
setopt brace_ccl
setopt auto_menu
setopt multios
setopt noautoremoveslash
setopt nolistbeep
setopt path_dirs

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

## editor
export EDITOR=vim
case $OSTYPE in
darwin*)
  export EDITOR=emacsclient
  ;;
esac

## path
export PATH=/usr/local/bin:$PATH

case $OSTYPE in
darwin*)
  export ANDROID_HOME=/usr/local/android-sdk-macosx
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export NODE_PATH=/usr/local/lib/node_modules
  export GISTY_DIR=$HOME/Dropbox/Gist
  export PATH=$PATH:$HOME/.rvm/bin
  source $HOME/.rvm/scripts/rvm
  ;;
linux*)
  export PATH=$PATH:/var/lib/gems/1.9.1/bin
  ;;
esac

## aliases
setopt complete_aliases

alias reload="source $HOME/.zshrc"

case $OSTYPE in
darwin*)
  alias ls="ls -G"
  alias emacs="open -a emacs"
  alias e="emacs"
  alias en="open -a emacs -n --args --debug-init"
  alias pwcopy="pwd | perl -pe 's/\n//' | pbcopy"
  ;;
linux*)
  alias e="emacs"
  alias ls="ls --color"
  ;;
esac

alias l="ls"
alias la="ls -A"
alias ll="ls -alF"

alias du="du -h"
alias df="df -h"

alias less="less -R"
alias diff="colordiff --side-by-side --suppress-common-lines --ignore-tab-expansion --ignore-space-change"

alias s="screen"

alias g="git"
alias gi="git"
alias gt="git"
alias gti="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"

alias ec="emacsclient -n"

alias irb="pry"
alias r="rails"
alias p="padrino"

alias pyserver='python -m SimpleHTTPServer > /dev/null 2>&1 &'

## options
export GREP_OPTIONS='--color=auto --exclude=*.git*'

export RSENSE_HOME="$HOME/.emacs.d/elisp/rsense"

export FIGNORE=".svn"

## include
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
