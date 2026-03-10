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
alias ss='slurp | grim -g - - | wl-copy'

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

y(){
  local url="$1"
  yt-dlp $url
}

ya(){
  local url="$1"
  yt-dlp -t mp3 "$url" -o "~/Music/%(uploader)s - %(title)s.%(ext)s"
}

yt2gif() {
  local url="$1"
  local outdir="$HOME/Pictures/gifs"
  mkdir -p "$outdir"
  local mp4=$(yt-dlp \
    -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
    --merge-output-format mp4 \
    -o "${outdir}/%(id)s.mp4" \
    --print after_move:filepath \
    "$url")

  if [[ ! -f "$mp4" ]]; then
    echo "Error: download failed or file not found: $mp4"
    return 1
  fi

  local base="${mp4%.mp4}"
  local palette="${base}_palette.png"
  local gif="${base}.gif"

  local fps=$(ffprobe -v error -select_streams v:0 \
    -show_entries stream=r_frame_rate \
    -of default=noprint_wrappers=1:nokey=1 "$mp4" \
    | awk -F'/' '{printf "%.3f", $1/$2}')

  local width=$(ffprobe -v error -select_streams v:0 \
    -show_entries stream=width \
    -of default=noprint_wrappers=1:nokey=1 "$mp4")

  local bitrate=$(ffprobe -v error -select_streams v:0 \
    -show_entries stream=bit_rate \
    -of default=noprint_wrappers=1:nokey=1 "$mp4")

  ffmpeg -i "$mp4" -vf \
    "fps=${fps},scale=${width}:-1:flags=lanczos,palettegen" \
    -y "$palette"

  ffmpeg -i "$mp4" -i "$palette" -filter_complex \
    "fps=${fps},scale=${width}:-1:flags=lanczos[x];[x][1:v]paletteuse" \
    -b:v "${bitrate}" \
    -y "$gif"

  rm -f "$palette" "$mp4"
  echo "Done: $gif"
}

# [[ -z "$TMUX" ]] && tmux attach 2>/dev/null
export PATH="$HOME/.npm-global/bin:$PATH"
