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

local prompt="${base_color}%n@%m${white}:${blue}%~${reset}$ "
local prompt_ok="${green}（、･∀･）、${prompt}"
local prompt_ng="${red}（、☓ω☓）、${prompt}"
local vcs="%1(v|${green} %1v${reset}|)"
local rvm="%2(v| ${red}(%2v)${reset}|)"

PROMPT="%0(?|${prompt_ok}|${prompt_ng})"
PROMPT2="${reset}> "
SPROMPT="%r is correct [n,y,a,e]? "
RPROMPT="${vcs}${rvm} (%*)"

## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt hist_reduce_blanks
setopt hist_no_store

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

if which percol > /dev/null; then
    function percol_select_history() {
        local tac
        which tac > /dev/null && tac="tac" || { tac="tail -r" }
        BUFFER=$(history -n 1 | eval $tac | percol --match-method migemo --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }
    zle -N percol_select_history
    bindkey '^r' percol_select_history
fi

## bind
bindkey -e
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

## completion
autoload -U compinit
compinit -u

zmodload -i zsh/complist

unsetopt menu_complete
unsetopt flowcontrol
setopt complete_in_word
setopt always_to_end
setopt auto_cd
setopt auto_name_dirs
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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select

[ -r /etc/ssh/ssh_known_hosts ] && _global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r $HOME/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
[ -r /etc/hosts ] && : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} || _etc_hosts=()
hosts=(
    "$_global_ssh_hosts[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    "$HOST"
    localhost
    )
zstyle ':completion:*:hosts' hosts $hosts

zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
    dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
    hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
    mailman mailnull mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _-./;@"
zstyle ':zle:*' word-style unspecified

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

source $HOME/.zsh/hub.zsh_completion

## editor
export EDITOR=vim
case $OSTYPE in
    darwin*)
        export EDITOR=emacsclient
        ;;
esac

## path
export PATH=/usr/local/bin:$PATH
export RSENSE_HOME=$HOME/.emacs.d/elisp/rsense

case $OSTYPE in
    darwin*)
        export ANDROID_HOME=/usr/local/android-sdk-macosx
        export PATH=$PATH:$ANDROID_HOME/tools
        export PATH=$PATH:$ANDROID_HOME/platform-tools
        export NODE_PATH=/usr/local/lib/node_modules
        export GISTY_DIR=$HOME/Dropbox/Gist
        export PATH=$PATH:$HOME/.rvm/bin
        source $HOME/.rvm/scripts/rvm
        export PERLBREW_ROOT=/usr/local/perlbrew
        source $PERLBREW_ROOT/etc/bashrc
        ;;
    linux*)
        export PATH=$PATH:/var/lib/gems/1.9.1/bin
        ;;
esac

## functions
function stats() {
    fc -l 1 | awk '{print $2}' | sort | uniq -c | sort -rn | head
}

function take() {
    mkdir -p $1
    cd $1
}

function percol_search_document() {
    if [ $# -ge 1 ]; then
        DOCUMENT_DIR=$*
    else
        DOCUMENT_DIR="$HOME/Documents $HOME/Dropbox"
    fi
    SELECTED_FILE=$(echo $DOCUMENT_DIR | xargs find | grep -E "\.(txt|md|pdf|key|numbers|pages|doc|xls|ppt)$" | percol --match-method migemo)
    if [ $? -eq 0 ]; then
        echo $SELECTED_FILE | sed 's/ /\\ /g'
    fi
}

function percol_locate() {
    if [ $# -ge 1 ]; then
        SELECTED_FILE=$(locate $* | percol --match-method migemo)
        if [ $? -eq 0 ]; then
            echo $SELECTED_FILE | sed 's/ /\\ /g'
        fi
    else
        locate
    fi
}

## neta
function nyan() {
    echo "$1ーーー$2！！$1$2$1ーーーーーー$2！！！！$1$2$1$1ーー$2$1$2！！！$1$2$1ー$2！！！！$1$1$1$1$1$1$1$1$1$1$1$1ーーーー$2！！！！！"
}

function nenne() {
    echo "$1$2したいよー！！！！$1$2ーーーー！！！！$1$2ー！！！$1$2$1$2$1$2$1$2！！$1$2がしたいの！！$1$2っ！！ウーーー！！！WOOOOOOO!!!!!$1っ！！$2！！！$1$2させてくれ$1$2！！$1$2！！$1$2！！"
}

function keshisaru() {
    echo "全ての$1を、生まれる前に消し去りたい。全ての宇宙、過去と未来の全ての$1を、この手で。"
}

## aliases
setopt complete_aliases

alias reload_zsh="source $HOME/.zshrc"

case $OSTYPE in
    darwin*)
        alias ls="ls -G"
        alias git="hub"
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

alias l="ls -1"
alias la="ls -1A"
alias ll="ls -1alF"

alias md='mkdir -p'
alias rd=rmdir

alias du="du -h"
alias df="df -h"

alias less="less -R"
alias diff="colordiff --suppress-common-lines --ignore-tab-expansion --ignore-space-change"

alias s="screen"

alias g="git"
alias gi="git"
alias gt="git"
alias gti="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"

alias ec="emacsclient -n"

alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias irb="pry"
alias r="rails"
alias rc="rails console"
alias rg="rails generate"
alias rs="rails server"

alias saba='python -m SimpleHTTPServer > /dev/null 2>&1 &'
alias shimesaba='pkill -f "python -m SimpleHTTPServer"'

alias sd='percol_search_document'
alias sp='percol_locate'

## pipe aliases
alias -g E='| xargs emacsclient -n'
alias -g O='| xargs open'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g S='| gsed'

## options
export GREP_OPTIONS='--color=auto --exclude=*.git*'

export FIGNORE=".svn"

## include
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
