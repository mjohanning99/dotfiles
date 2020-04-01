# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sophon/.oh-my-zsh"

#Theme to load
ZSH_THEME="lukerandall"
#duelj, afowler, random, xiong-chiamiov, lukerandall, gnzh, clean

#Plugins
plugins=(git zsh-autosuggestions z zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#User configuration
#
#Aliases
#
#Email aliases
#
alias mail="mbsync -a ; neomutt" #Automatically download new emails and open neomutt
alias email="mbsync -a ; neomutt"
alias mutt="mbsync -a ; neomutt"
alias download_mail="mbsync -a"

#Variable exports
export RTV_BROWSER=w3m
export VISUAL=vim
export EDITOR=vim
export TERMINAL=termite

#Keybindings
#
#Keybindings for autosuggest
bindkey '^ ' autosuggest-accept #Ctrl + Space
bindkey '^\n' autosuggest-execute #Doesn't seem work, Ctrl+<CR>

#Keybindings for searching through the history
bindkey '^[j' history-search-forward #Alt + j 
bindkey '^[k' history-search-backward #Alt + k

#cdn + number will move to the xth parent directory (cdn 2 = cd ../..)
function cdn() { for i in `seq $1`; do cd ..; done; }

#Prevent nested ranger instances
ranger() {
  if [ -z "$RANGER_LEVEL" ]; then
    /usr/bin/ranger "$@"
  else
    exit
  fi
}

#For Pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

#Path changes
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
