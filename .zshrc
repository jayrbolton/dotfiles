PATH=$PATH:~/bin

# Properly delete chars with backspace in vim:
stty erase '^?'

# for gpg pinentry
export GPG_TTY=`tty`

autoload -U colors && colors
[ -f $HOME/.aliases ] && source $HOME/.aliases

export VISUAL=vim
export EDITOR=vim

SAVEHIST=10000 # Number of entries
HISTSIZE=10000
HISTFILE=~/.zsh/history # File
setopt incappendhistory
setopt appendhistory
setopt sharehistory

NEWLINE=$'\n'
export PROMPT="%{$fg[blue]%}%~%{$reset_color%} ${NEWLINE}$ " #$VIINS

# Emacs keybindings
bindkey -e

export PATH="$PATH:/home/j/.dat/releases/dat-13.13.1-linux-x64"

setopt promptsubst
PS1=$'%U${(r:$COLUMNS:: :)}%u'$PS1
