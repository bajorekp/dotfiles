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
alias gl="git pull --rebase"
alias gp="git push"
alias gr="git rebase --autosquash"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff HEAD"
alias gblame="git blame"
# Ignore all whitespaces, EOL, and blank lines
alias git-diff-ignore-space="git diff --color=always --ignore-all-space --ignore-space-change --ignore-space-at-eol --ignore-blank-lines"
# Ignore whitespace,
# and detect lines moved or copied in the same commit,
# or the commit that created the file,
# or any commit at all
alias gblame-deep="git blame -w -C -C -C"
alias gdiff-origin="git diff origin/\`git branch --show-current\` HEAD -- \$(git diff --name-only master)"
# pull branch $1 and rebase from it
gu() { gco $1 && gl && gco - && gr $1 }
# removes all branches
git-autopurge() { git branch -D $(git branch --format='%(refname:short)') }
# update commit in place with autosquash rebase in interactive mode with fzf
gamend() {
  if ! git diff --quiet; then
    echo "There are unstaged changes."
    return 1
  fi
  commit_id=$(git log --oneline | fzf | awk '{print $1}')
  # exit if commit_id is empty
  if [ -z "$commit_id" ]; then
    echo "No commit ID selected"
    return 2
  fi
  echo "Selected commit ID: $commit_id"
  # commit files in the stash
  git commit --fixup $commit_id
  # update commit without opening the editor
  GIT_SEQUENCE_EDITOR=true git rebase -i --autosquash $commit_id~1
}
# stash not staged files, and update commit in place
gamend-stash() {
  # Check if there are staged changes
  if git diff --cached --quiet; then
    echo "Error: Nothing to commit."
    return 1
  fi

  # Select commit ID
  commit_id=$(git log --oneline | fzf | awk '{print $1}')
  if [ -z "$commit_id" ]; then
    echo "No commit ID selected"
    return 2
  fi
  echo "--- Selected commit ID: $commit_id"

  echo "--- Stash not staged files"
  git stash push --keep-index

  echo "--- Commit files in the stash"
  git commit --fixup $commit_id

  echo "--- Update commit without opening the editor"
  GIT_SEQUENCE_EDITOR=true git rebase -i --autosquash $commit_id~1

  # Check if the rebase failed due to conflicts
  if [ $? -ne 0 ]; then
    echo "--- Rebase conflict detected. Aborting rebase..."
    git rebase --abort
    echo "--- Rebase aborted. Undoing last commit..."
    git reset --soft HEAD~1
    echo "--- Last commit undone."
  else
    echo "--- Rebase completed successfully."
  fi

  echo "--- Pop stash"
  git stash pop
}
# copy the PWD path to the clipboard, then print clipboard for confirmation
alias pbpwd="echo -n $PWD | pbcopy && echo $PWD"
# reloads shell configuration
alias reload="source ~/.zshrc"

# change directory to most frequent match
# z dev == cd ~/Developer
# https://github.com/rupa/z
source /opt/homebrew/etc/profile.d/z.sh

# remember elixir history
alias iex='iex --erl "-kernel shell_history enabled"'

# copilot tooling
alias explain-last-command='(COMMAND=`history | tail -1 | head -1 | cut -c8-`; echo "$COMMAND"; gh copilot explain "$COMMAND")'
alias suggest='gh copilot suggest -t shell'

# json tooling
alias json-parse='ruby -rjson -e "puts JSON.pretty_generate(JSON.parse(ARGV[0]))"'

# fuzzy serach
function code-search() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
  fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(code -g {1}:{2})'
}

# Add tools to PATH
TOOLS_PATH=$(readlink -f "$(dirname "$0")/../tools")
PATH="$PATH:$TOOLS_PATH"

# Add rust to PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Add go to PATH
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/go/bin"
