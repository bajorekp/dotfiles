#!/bin/bash

source ./config.env

# Install homebrew and Command Line Tools if missing
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Path to Homebrew: $(which brew)"

# Print Xcode Command Line Tools installation path
echo "Path to Xcode Command Line Tools: $(xcode-select -p)"
