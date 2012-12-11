## Misc

# Lang
export LANG=ja_JP.UTF-8

# Editor
case $OSTYPE in
    darwin*)
        export EDITOR=emacsclient
        ;;
    *)
        export EDITOR=vim
        ;;
esac

# Path
export PATH=/usr/local/bin:$PATH
export RSENSE_HOME=$HOME/.emacs.d/elisp/rsense

case $OSTYPE in
    darwin*)
        # RVM
        export PATH=$PATH:$HOME/.rvm/bin
        source $HOME/.rvm/scripts/rvm
        # Perlbrew
        export PERLBREW_ROOT=/usr/local/perlbrew
        source $PERLBREW_ROOT/etc/bashrc
        # Node
        export NODE_PATH=/usr/local/lib/node_modules
        # Android
        export ANDROID_HOME=/usr/local/android-sdk-macosx
        export PATH=$PATH:$ANDROID_HOME/tools
        export PATH=$PATH:$ANDROID_HOME/platform-tools
        # Gisty
        export GISTY_DIR=$HOME/Dropbox/Gist
        ;;
    linux*)
        # Ruby
        export PATH=$PATH:/var/lib/gems/1.9.1/bin
        ;;
esac

# Grep
export GREP_OPTIONS='--color=auto --exclude=*.git*'
