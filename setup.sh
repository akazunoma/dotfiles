#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

## functions
function _execute() {
    echo $*
    eval $*
}

function _create_symlink_unless_exists() {
    if [ -e $2 ]; then
        echo "$2: File exists"
    else
        _execute "ln -s $1 $2"
    fi
}

## dotfiles
DOTFILES=(.zshrc .zsh .emacs.d .gitconfig .gitignore .screenrc .gemrc .pryrc .percol.d)
for name in ${DOTFILES[@]}
do
    if [ -d $DOTFILES_DIR/$name ]; then
        _create_symlink_unless_exists $DOTFILES_DIR/$name/ $HOME/$name
    else
        _create_symlink_unless_exists $DOTFILES_DIR/$name $HOME/$name
    fi
done

## .screenrc.local
if [[ $OSTYPE =~ "darwin" ]]; then
    _create_symlink_unless_exists $DOTFILES_DIR/.screenrc.osx $HOME/.screenrc.local
else
    _create_symlink_unless_exists $DOTFILES_DIR/.screenrc.linux $HOME/.screenrc.local
fi

## .zshrc.local
_execute "touch $HOME/.zshrc.local"

## .rsense
if which ruby > /dev/null; then
    _execute "ruby $DOTFILES_DIR/.emacs.d/elisp/rsense/etc/config.rb > ~/.rsense"
fi
