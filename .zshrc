# mac dotfiles

### oh-my-zsh stuff #####################
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(git)
source $ZSH/oh-my-zsh.sh
### #####################################

# Use vim keybindings
bindkey -v
# fix history not working in vim mode
bindkey '^r' history-incremental-search-backward

export EDITOR=vim

# basics
alias ag='rg'
alias f='ag -i -g'

alias grep='grep --color=auto'
alias la='ls -A'
alias ll='ls -Ahl'
alias ls='ls --color=auto'

# git
alias ga='git add'
alias gb='git branch' 
alias gc="git commit"
alias gd="git diff"
alias gd='git diff'
alias gdc="git diff --cached"
alias gl="git log --oneline"
alias gll="git log"
alias gln="git log --oneline -n"
alias gs="git status -s"
alias gss="git status"

alias sz='source ~/.zshrc'
alias v='vim ~/.vimrc'
alias z='vim ~/.zshrc'
alias s="cd ~/src"

# misc
alias z="vim ~/.zshrc"
alias v="vim ~/.vimrc"
alias sz="source ~/.zshrc"

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# never ever beep ever
setopt NO_BEEP

zstyle ':completion:*' menu select

ZSH_THEME="agnoster"
