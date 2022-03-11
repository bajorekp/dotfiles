#!/bin/bash

# Initializes config.env with missing values
bash autoconfig.sh

# Loads configuration
source ./config.env

# Creates required directories
mkdir -vp $DEVELOPER_PATH

# Install Brew package manager
bash ./setup/homebrew.sh
eval $(/opt/homebrew/bin/brew shellenv)

# Installs apps (needs user action)
bash ./setup/packages.sh

# Sets system
bash ./setup/mac_general.sh
bash ./setup/mac_dock.sh

# Sets Github (needs user action)
bash ./setup/git.sh

# Clones the repo into Developer directory
bash ./setup/repo_setup.sh

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
