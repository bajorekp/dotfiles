#!/bin/bash

mkdir -p ~/Library/local
git clone git://github.com/RobSis/zsh-completion-generator.git ~/Library/local/zsh-completion-generator
git clone git://github.com/zsh-users/zsh-completions.git ~/Library/local/zsh-completions

if ! command -v oh-my-posh &> /dev/null; then
  brew tap jandedobbeleer/oh-my-posh
  brew install oh-my-posh
fi

ln -sf $HOME/Developer/dotfiles/zsh/.zshrc $HOME/.zshrc
