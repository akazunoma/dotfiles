#!/bin/sh

## functions
function execute() {
    echo $*
    eval $*
}

function create_symlink_unless_exists() {
    if [ -e $2 ]; then
        echo "$2: File exists"
    else
        execute "ln -s $1 $2"
    fi
}

## dotfiles dir
DOTFILES_DIR=$(cd $(dirname $0) && pwd)

## dotfiles
DOTFILES=(.zshrc .zsh .emacs.d .gitconfig .gitignore .screenrc .gemrc .pryrc .percol.d)
for name in ${DOTFILES[@]}
do
    create_symlink_unless_exists $DOTFILES_DIR/$name $HOME/$name
done

## .screenrc.local
if [[ $OSTYPE =~ "darwin" ]]; then
    create_symlink_unless_exists $DOTFILES_DIR/.screenrc.osx $HOME/.screenrc.local
else
    create_symlink_unless_exists $DOTFILES_DIR/.screenrc.linux $HOME/.screenrc.local
fi

## .zshrc.local
execute "touch $HOME/.zshrc.local"

## .rsense
if which ruby > /dev/null; then
    execute "ruby $DOTFILES_DIR/.emacs.d/elisp/rsense/etc/config.rb > ~/.rsense"
fi
