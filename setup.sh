#!/bin/bash

# Initializes config.env with missing values
bash autoconfig.sh

# Loads configuration
source ./config.env

# Creates required directories
mkdir -vp $DEVELOPER_PATH

# Installs Brew package manager
# May need user password for xcode-select instalation
# and iCloud password to App Store
# This are long running task
bash ./setup/homebrew.sh
eval $(/opt/homebrew/bin/brew shellenv)
bash ./setup/packages.sh

# As we have git installed, we can clone the repo to its final 
# destination to use dotfiles linking
bash ./setup/repo_setup.sh

# Sets system up
bash ./setup/mac_general.sh
bash ./setup/mac_dock.sh

# Setup Git
bash ./setup/git.sh

# Setup terminal
bash ./setup/fonts.sh
bash ./setup/terminal.sh
bash ./setup/shell.sh

# Setup Virtual Studio Code
bash ./setup/vs_code.sh

# Setup VIM
bash ./setup/vim.sh

# Installs single manager for multiple languages
bash ./setup/asdf.sh

# Login to Github (always needs user action)
bash ./setup/github.sh
