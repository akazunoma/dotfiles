#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

## dotfiles
DOTFILES=(.zshrc .zsh .emacs.d .gitconfig .gitignore .screenrc .gemrc .pryrc .percol.d)
for name in ${DOTFILES[@]}
do
    if [ -d $DOTFILES_DIR/$name ]; then
        echo "ln -s $DOTFILES_DIR/$name/ $HOME/$name"
        ln -s $DOTFILES_DIR/$name/ $HOME/$name
    else
        echo "ln -s $DOTFILES_DIR/$name $HOME/$name"
        ln -s $DOTFILES_DIR/$name $HOME/$name
    fi
done

## .screenrc.local
if [[ $OSTYPE =~ "darwin" ]]; then
    echo "ln -s $DOTFILES_DIR/.screenrc.osx $HOME/.screenrc.local"
    ln -s $DOTFILES_DIR/.screenrc.osx $HOME/.screenrc.local
else
    echo "ln -s $DOTFILES_DIR/.screenrc.linux $HOME/.screenrc.local"
    ln -s $DOTFILES_DIR/.screenrc.linux $HOME/.screenrc.local
fi

## .zshrc.local
echo "touch $HOME/.zshrc.local"
touch $HOME/.zshrc.local

## .rsense
if which ruby > /dev/null; then
    echo "ruby $DOTFILES_DIR/.emacs.d/elisp/rsense/etc/config.rb > ~/.rsense"
    ruby $DOTFILES_DIR/.emacs.d/elisp/rsense/etc/config.rb > ~/.rsense
fi
