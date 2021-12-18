#!/bin/bash

source ./config.env

# Install Homebrew and Command Line Tools if missing
if ! command -v brew &> /dev/null; then
  # Requests sudo password faster - before processing
  sudo echo
  # echo - this press Enter to continue without prompt
  echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Adds Homebrew to PATH
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
  eval $(/opt/homebrew/bin/brew shellenv)
fi
echo "Path to Homebrew: $(which brew)"

# Print Xcode Command Line Tools installation path
echo "Path to Xcode Command Line Tools: $(xcode-select -p)"
