#Pretty prompt
#PS1="%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{$%f%}%  "
autoload -U colors && colors
#PS1="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[cyan]%}`hostname | sed s/.amazon.com//`%{$reset_color%}:%{$fg[yellow]%}%d%{$reset_color%}][>] "

PS1="%{$fg[cyan]%}[%{$fg[red]%}%n%{$fg[cyan]%}] %{$fg[yellow]%}%~%{$reset_color%} > "

export EDITOR=vim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -A'
alias ll='ls -Ahl'

#git
alias gs="git status -s"
alias gss="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga='git add'
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"
alias gln="git log --oneline -n"
alias gll="git log"

alias gb='git branch' 
alias gbu='echo "The upstream branch: $(git rev-parse --abbrev-ref --symbolic-full-name @{u})"' #print this branch's upstream branch
alias gbls='git branch -vv'
alias gd='git diff'
alias glg='git log --graph --decorate --all --oneline' #show the git DAG as a graph, for local branches and all known remotes
alias glgp='git log -p --graph --decorate --oneline' #show the git DAG as a graph, and as patches.
alias gri='git rebase -i'

#dotfiles
alias v='vim ~/.vimrc'
alias vd='vim ./.'
alias z='vim ~/.zshrc'
alias sz='source ~/.zshrc'

#misc
alias op="xdg-open"
alias z="vim ~/.zshrc"
alias v="vim ~/.vimrc"
alias sz="source ~/.zshrc"
alias ms="cd /mnt/c/Users/ruvan/"
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Use vim keybindings
bindkey -v
# Use emacs keybindings (lol why would you)
# bindkey -e

## history
setopt APPEND_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
LISTMAX=0

## disable mail checking
MAILCHECK=0

# =============================================================================
# Aliases
# =============================================================================

# Handle the fact that this file will be used with multiple OSs
 platform=`uname`
 if [[ $platform == 'Linux' ]]; then
     alias a='ls -lrth --color'
     #other platform specific aliases, exports etc
 elif [[ $platform == 'Darwin' ]]; then
     alias a='ls -lrthG'
     #other platform specific aliases, exports etc
 fi
