#############################
### Env
#############################

### Adds Homebrew packages on front of PATH.
#
# Evals following code:
#
# export HOMEBREW_PREFIX="/opt/homebrew";
# export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
# export HOMEBREW_REPOSITORY="/opt/homebrew";
# export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
# export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
# export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setup editor envs
export EDITOR="vim"
export VISUAL="code --wait"

#############################
### Aliases
#############################

# Lists directory content
# --color in color
# -l in list
# -A shows hiden files withou . and ..
alias l="ls --color -lA"
# lists directories
lsd() { ls --color -lAd ${1:-.} ${1:-.}/*/; }

# Creates a dir and cd's into it
mkcd() { mkdir -p "$@" && cd "$@"; }

# Removes directory
alias rm="rm -v"
alias rmd="rm -rfv"

### Git
alias gst="git status"
alias ga="git add"
alias gco="git checkout"
alias glog="git log --oneline"
alias gl="git pull"
alias gp="git push"
alias gr="git rebase -i --autosquash"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff HEAD"
# pull branch $1 and rebase from it
gu() { gco $1 && gl && gco - && gr $1 }
# removes all branches
git-autopurge() { git branch -D $(git branch --format='%(refname:short)') }
# copy the PWD path to the clipboard, then print clipboard for confirmation
alias pbpwd="echo -n $PWD | pbcopy && echo $PWD"
# reloads shell configuration
alias reload="source ~/.zshrc"

# change directory to most frequent match
# z dev == cd ~/Developer
# https://github.com/rupa/z
source /opt/homebrew/etc/profile.d/z.sh
