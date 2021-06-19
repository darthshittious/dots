#!/usr/bin/zsh
alias vimdiff="nvim -d"
alias ls="lsd"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ytdl="youtube-dl"
alias python=python3.9
alias pip="python3 -m pip"
alias py="python3.9"
alias python3="python3.9"
alias vim="nvim"
alias vi="nvim"
alias lolcat="lolcat --truecolor"
alias rg="rg --hidden -i"
alias yay="echo 'USE PARU IDIOT' && paru"
alias pin="paru -S"
alias pun="paru -Rns"
alias pup="paru -Syu"
alias src="source $HOME/.zshrc"

ghc() { git clone "git@github.com:${1:?gib user dumbo}/${2:?gib repo dumbo}" $3 }

mkcd() {
  mkdir "$1" && cd "$1"
}

ctxgrep() {
  i="${2:-10}"
  rg -o ".{0,$i}${1:?You did not give me anything to grep for lol}.{0,$i}"
}

wal() {
  command wal $* && cp $HOME/.cache/wal/walcord.theme.css $HOME/.var/app/com.discordapp.Discord/config/BetterDiscord/themes
}

cowsay() {
  local cow="$(command cowsay -l | sed -e "1d" -e "s/\s/\n/g" | shuf -n 1)"
  command cowsay -f "$cow" $*
}

sxivremote() {
  curl -sS "${1:?Please specify a URL}" -o /tmp/sxivremote &&
    sxiv /tmp/sxivremote &&
    rm -f /tmp/sxivremote
}

codi() {
  local syntax="${1:-javascript}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}
