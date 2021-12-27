#!/bin/bash

# Initializes config.env with missing values
bash autoconfig.sh

# Loads configuration
source ./config.env

# Creates required directories
mkdir -vp $DEVELOPER_DIR

# Installs apps (needs user action)
bash ./setup/homebrew.sh
bash ./setup/packages.sh

# Sets system
bash ./setup/mac_general.sh
bash ./setup/mac_dock.sh

# Sets Github (needs user action)
bash ./setup/git.sh
bash ./setup/repo_setup.sh

# Setup terminal
bash ./setup/fonts.sh
bash ./setup/terminal.sh
bash ./setup/shell.sh
