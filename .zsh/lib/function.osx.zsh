## Function OSX

if [[ $OSTYPE =~ "darwin" ]]; then
else
    return
fi

function man-preview() {
    man -t "$@" | open -f -a Preview
}
