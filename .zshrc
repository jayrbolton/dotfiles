# Properly delete chars with backspace in vim:
stty erase '^?'

autoload -U colors && colors

[ -f $HOME/.keys ] && source $HOME/.keys
[ -f $HOME/.aliases ] && source $HOME/.aliases

export VISUAL=vim
export EDITOR=vim

export SHARE_HISTORY=true

export APACHE_RUN_USER=jb
export APACHE_RUN_USER=netdev

export NODE_ENV=development
export RAILS_ENV=development

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# ### Extra bin paths
export PATH="$HOME/.npm-packages/bin:$PATH" # npm
export PATH="$HOME/bin:$PATH" # my own bins
export PATH="$HOME/.cabal/bin:$PATH" # haskell cabal

# ## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# vi-mode for zsh
bindkey -v

# Use vim cli mode
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

bindkey 'jk' vi-cmd-mode

VICMD="%{$fg[green]%}[cmd]%{$reset_color%} "
VIINS="%{$fg[blue]%}[ins]%{$reset_color%} "
export PROMPT=$VIINS

function zle-line-init zle-keymap-select {
	PROMPT="${${KEYMAP/vicmd/$VICMD}/(main|viins)/$VIINS}"
	zle reset-prompt
}

zle-line-init() { typeset -g __prompt_status="$?" }

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=0

export RPROMPT="%{$fg[blue]%}%~%{$reset_color%}"
