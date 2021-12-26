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
alias gr="git rebase"
alias gb="git branch"
# pull branch $1 and rebase from it
gu() { gco $1 && gl && gco - && gr $1 }
# removes all branches
git_autopurge() { git branch -D $(git branch --format='%(refname:short)') }
