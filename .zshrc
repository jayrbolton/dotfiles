 # Properly delete chars with backspace in vim:
stty erase '^?'

# Node version manager ('n')
export N_PREFIX=$HOME/.node_versions

autoload -U colors && colors

[ -f $HOME/.keys ] && source $HOME/.keys
[ -f $HOME/.aliases ] && source $HOME/.aliases

export VISUAL=vim
export EDITOR=vim

SAVEHIST=10000 # Number of entries
HISTSIZE=10000
HISTFILE=~/.zsh/history # File
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals

export APACHE_RUN_USER=jb
export APACHE_RUN_USER=netdev

export NODE_ENV=development
export RAILS_ENV=development

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# ### Extra bin paths
export PATH="$HOME/.npm-packages/bin:$PATH" # npm
export PATH="$HOME/bin:$PATH" # my own bins
export PATH="$HOME/.cabal/bin:$PATH" # haskell cabal
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/bin/activator-1.3.10-minimal/bin:$PATH"

# todo.txt
export PATH="$HOME/.todo.txt:$PATH"
export TODO_ACTIONS_DIR="$HOME/.todo.txt/actions"
[ -f $HOME/.todo.txt/todo.txt_cli-2.10/todo_completion ] && source $HOME/.keys

# ## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# vi-mode for zsh
# bindkey -v
bindkey -e

# Use vim cli mode
# bindkey '^P' history-search-backward
# bindkey '^N' history-search-forward

# bindkey 'ei' vi-cmd-mode

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
# bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward


# VICMD="%{$fg[green]%}[cmd]%{$reset_color%} "
# VIINS="%{$fg[blue]%}[ins]%{$reset_color%} "
NEWLINE=$'\n'
source ~/.zsh-git-prompt/zshrc.sh
export PROMPT="%{$fg[blue]%}%~%{$reset_color%} ${NEWLINE}$ " #$VIINS
export RPROMPT='$(git_super_status) %# '

export KEYTIMEOUT=0

autoload -Uz compinit && compinit

export NVM_DIR="/home/big/j/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Load gpg agent info
if [ -f "${HOME}/.gpg-agent-info" ]; then 
  source "${HOME}/.gpg-agent-info";
  export GPG_AGENT_INFO 
fi
