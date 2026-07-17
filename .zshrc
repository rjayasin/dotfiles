### oh-my-zsh stuff #####################
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git)
source $ZSH/oh-my-zsh.sh
### #####################################

# Use vim keybindings
bindkey -v
# fix history not working in vim mode
bindkey '^r' history-incremental-search-backward

export EDITOR=nvim

# basics
alias vim='nvim'
alias ag='rg -i'
alias f='rg --files | rg'

# spawn (or re-attach to) claude in a dedicated tmux session
alias ct='tmux new-session -A -s claude claude'

alias grep='grep --color=auto'
# Directory color = bold blue (Ex). Safe because iTerm "brighten bold text" is OFF, so bold
# renders as bold-weight normal blue (#268bd2), not the grey Ansi 12. Rest are BSD ls defaults.
export CLICOLOR=1
export LSCOLORS='Exfxcxdxbxegedabagacad'
alias ls='ls -p --color=auto'
alias la='ls -A'
alias ll='ls -Ahl'

# git
alias ga='git add'
alias ga.='git add .'
alias gb='git branch' 
alias gc-="git checkout -"
alias gc="git commit"
alias gcm="git checkout main || git checkout master"
alias gcno="git commit --amend --no-edit"
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git log --oneline"
alias gll="git log"
alias gln="git log --oneline -n"
alias gs="git status -s"
alias gss="git status"
alias web="gh repo view --web"
alias dep='GH_PAGER= gh run view $(gh run list --limit 1 --json databaseId --jq ".[0].databaseId") --web'


alias s="cd ~/src"
alias sz="source ~/.zshrc"
alias v="vim ~/.vimrc"
alias z="vim ~/.zshrc"

vf() { local file=$(fzf --preview 'bat --color=always {}'); [[ -n "$file" ]] && vim "$file"; }

fuji() {
    if [[ -z "$1" ]]; then
        echo "Usage: fuji <filename>"
        return 1
    fi
    exiftool "$1" | rg -i "grain|film mode|white|highlight|shadow|clarity|color chrome|iso|Exposure Compensation|noise|saturation|Dynamic Range|Shutter Speed[ ]*:|Aperture Value" | sort
}


# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# never ever beep ever
setopt NO_BEEP

zstyle ':completion:*' menu select
# Color completion matches to mirror ls (LS_COLORS format, not BSD LSCOLORS).
# di = directories = bold blue (01;34); rest mirror LSCOLORS pairs. Overrides oh-my-zsh's empty default.
zstyle ':completion:*' list-colors 'di=01;34' 'ln=35' 'so=32' 'pi=33' 'ex=31'

export PATH="$HOME/.local/bin:$PATH"
if [ -f ~/.fzf.zsh ]; then source ~/.fzf.zsh; fi
