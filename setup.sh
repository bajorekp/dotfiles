#!/bin/bash

# Initializes config.env with missing values
bash autoconfig.sh

# Loads configuration
source ./config.env

# Creates required directories
mkdir -vp $DEVELOPER_DIR

# Installs apps
bash ./setup/homebrew.sh
bash ./setup/packages.sh

# Sets system
bash ./setup/mac_dock.sh
