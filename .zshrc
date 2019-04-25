# for gpg pinentry
export GPG_TTY=`tty`

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
setopt incappendhistory
setopt appendhistory
setopt sharehistory

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# ### Extra bin paths
export PATH="$HOME/.local/bin:$PATH"
# emacs mode
bindkey -e

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# VICMD="%{$fg[green]%}[cmd]%{$reset_color%} "
# VIINS="%{$fg[blue]%}[ins]%{$reset_color%} "
NEWLINE=$'\n'
source ~/.zsh-git-prompt/zshrc.sh
export PROMPT="%{$fg[blue]%}%~%{$reset_color%} ${NEWLINE}$ " #$VIINS
export RPROMPT='%{$fg[blue]%}$(date "+%m-%d %H:%M:%S")%{$reset_color%} $(git_super_status) %# '

export KEYTIMEOUT=0

autoload -Uz compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Load gpg agent info
if [ -f "${HOME}/.gpg-agent-info" ]; then 
  source "${HOME}/.gpg-agent-info";
  export GPG_AGENT_INFO 
fi

# Rust cargo bin
export PATH="$HOME/.cargo/bin:$PATH"

# Canonical Snap package manager
export PATH="/snap/bin:$PATH"

# Miniconda
source /opt/miniconda3/etc/profile.d/conda.sh
export PATH="/opt/miniconda3/bin:$PATH"

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

# Rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export KBASE_USERNAME="jayrbolton"
export KBASE_TOKEN="xyz"

# added by travis gem
[ -f /home/j/.travis/travis.sh ] && source /home/j/.travis/travis.sh

# GO programming language
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go-workspace/"
export PATH="$PATH:$GOPATH/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/j/.sdkman"
[[ -s "/home/j/.sdkman/bin/sdkman-init.sh" ]] && source "/home/j/.sdkman/bin/sdkman-init.sh"

# Add all that HMMER shit into the path
export PATH="$PATH:/home/j/installs/hmmer-3.1b2-linux-intel-x86_64/binaries"
# Add all that pplacer shit into the path
export PATH="$PATH:/home/j/installs/pplacer-Linux-v1.1.alpha19"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/j/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/j/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/j/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/j/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

plugins=(git ssh-agent)

eval `keychain --agents ssh --eval id_rsa`
