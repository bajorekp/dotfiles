#!/bin/bash

mkdir -p ~/Library/local
git clone git://github.com/RobSis/zsh-completion-generator.git ~/Library/local/zsh-completion-generator
git clone git://github.com/zsh-users/zsh-completions.git ~/Library/local/zsh-completions

ln -sf $HOME/Developer/dotfiles/zsh/.zshrc $HOME/.zshrc
