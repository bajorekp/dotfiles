#!/bin/bash

ln -sf $HOME/Developer/dotfiles/git/.gitconfig $HOME/.gitconfig

# Setups GitHub and git auth
gh auth login
gh auth setup-git
