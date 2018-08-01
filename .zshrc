# Pretty prompt
autoload -U colors && colors
PS1="%{$fg[cyan]%}[%{$fg[red]%}%n%{$fg[cyan]%}] %{$fg[yellow]%}%~%{$reset_color%} $ "

# bind caps to escape
setxkbmap -option caps:swapescape

# basics
alias f='ag -i -g'

alias grep='grep --color=auto'
alias la='ls -A'
alias ll='ls -Ahl'
alias ls='ls --color=auto'
export EDITOR=vim

# git
alias ga='git add'
alias gb='git branch' 
alias gbls='git branch -vv'
alias gbu='echo "The upstream branch: $(git rev-parse --abbrev-ref --symbolic-full-name @{u})"' #print this branch's upstream branch
alias gc="git commit"
alias gd="git diff"
alias gd='git diff'
alias gdc="git diff --cached"
alias gl="git log --oneline"
alias glg='git log --graph --decorate --all --oneline' #show the git DAG as a graph, for local branches and all known remotes
alias glgp='git log -p --graph --decorate --oneline' #show the git DAG as a graph, and as patches.
alias gll="git log"
alias gln="git log --oneline -n"
alias gp="git push"
alias gri='git rebase -i'
alias gs="git status -s"
alias gss="git status"

# dotfiles

alias i='vim ~/.config/i3/config'
alias sz='source ~/.zshrc'
alias v='vim ~/.vimrc'
alias vd='vim ./.'
alias z='vim ~/.zshrc'
# misc
alias op="xdg-open"
alias z="vim ~/.zshrc"
alias v="vim ~/.vimrc"
alias sz="source ~/.zshrc"

plugins=(
  git
  python
)

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Use vim keybindings
bindkey -v

# history
setopt APPEND_HISTORY

# never ever beep ever
setopt NO_BEEP

# automatically decide when to page a list of completions
LISTMAX=0

# disable mail checking
MAILCHECK=0

zstyle ':completion:*' menu select

ZSH_THEME="agnoster"
