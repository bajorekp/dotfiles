#!/bin/bash

ln -sf $HOME/Developer/dotfiles/git/.gitconfig $HOME/.gitconfig
cd $HOME/Developer/dotfiles/git
cp user.gitconfig.example user.gitconfig

# Setups GitHub and git auth
gh auth login
gh auth setup-git
