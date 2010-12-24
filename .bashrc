# Editor
export EDITOR="emacsclient"

# History
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL="ignoredups"

# Other Aliases
alias e="emacs"
alias emacsclient="emacsclient -n"
alias ec="emacsclient"
alias g="git"
alias less="less -R"
alias diff="colordiff --side-by-side --suppress-common-lines --ignore-tab-expansion --ignore-space-change"

# Readline
bind -x '"\C-x\C-e": e'
bind '"\e\C-f": forward-word'
bind '"\e\C-b": backward-word'

# Dropbox
DROPBOX_HOME="$HOME/dropbox"

# Dropbox Bin
export PATH="$PATH:$DROPBOX_HOME/bin"

# Rsense
export RSENSE_HOME="$HOME/.emacs.d/elisp/rsense"
