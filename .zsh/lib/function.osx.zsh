## Function OSX

if [[ $OSTYPE =~ "darwin" ]]; then
else
    return
fi

function man-preview() {
    man -t "$@" | open -f -a Preview
}

function copy-line-as-kill() {
    zle kill-line
    print -rn $CUTBUFFER | pbcopy
}
zle -N copy-line-as-kill

function paste-as-yank() {
    pbpaste
}
zle -N paste-as-yank

bindkey '^k' copy-line-as-kill
bindkey "^y" paste-as-yank
