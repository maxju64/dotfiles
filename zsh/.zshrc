export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto      # update automatically without asking
# DISABLE_LS_COLORS="true"

export VISUAL=nvim
export EDITOR="$VISUAL"
export NVIDIA_DRIVER_CAPABILITIES=all
export TERMINAL=kitty

HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
[ -f "/home/max/.ghcup/env" ] && . "/home/max/.ghcup/env" # ghcup-env

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS=""

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

export ARCHFLAGS="-arch $(uname -m)"

alias ls='ls --color=always'
alias start='start-hyprland'
alias less='less -R'
alias lg='lazygit'

#tmux binds
alias config='tmux attach -s config'

set -o vi

source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

update()
{
	sudo pacman -Syu
}

alias ss='slurp | grim -g - - | wl-copy'

connect(){
  kitty +kitten ssh myserver
}

reload(){
  kill -SIGUSR1 $KITTY_PID
}

sd(){
  shutdown now
}

whatsonport() {
    lsof -i tcp:$1
}

pm(){
  pacmixer
}

# [[ -z "$TMUX" ]] && tmux attach 2>/dev/null
export PATH="$HOME/.npm-global/bin:$PATH"
