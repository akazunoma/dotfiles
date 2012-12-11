## Alias

case $OSTYPE in
    darwin*)
        alias ls="ls -G"
        alias emacs="open -a emacs"
        alias e="open -a emacs"
        alias git="hub"
        alias copy-pwd="pwd | perl -pe 's/\n//' | pbcopy"
        ;;
    linux*)
        alias ls="ls --color"
        alias e="emacs"
        ;;
esac

alias l="ls -1"
alias la="ls -1A"
alias ll="ls -1alF"

alias gr="grep"
alias gri="grep -i"
alias grl="grep -l"

alias du="du -h"
alias df="df -h"

alias s="screen"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"

alias ec="emacsclient -n"

# Ruby
alias irb="pry"
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"
alias r="rails"
alias rc="rails console"
alias rg="rails generate"
alias rs="rails server"

# Python
alias saba="python -m SimpleHTTPServer > /dev/null 2>&1 &"
alias shimesaba="pkill -f "python -m SimpleHTTPServer""

# Global
alias -g E="| xargs emacsclient -n"
alias -g O="| xargs open"
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g S="| sed"
alias -g P="| percol --match-method migemo"
