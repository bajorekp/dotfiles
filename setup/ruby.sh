#!/bin/bash

# Installs GPG if missing
brew install gnupg

# Adds Michal Papis and Piotr Kuczynski signatures
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Installs RVM
# backslash skips aliases
\curl -sSL https://get.rvm.io | bash -s stable --ignore-dotfiles
export PATH="$PATH:$HOME/.rvm/bin"

# Install required packages
rvm requirements

# Install Ruby 3
# command = non interactive mode for rvm
command rvm install 3.1.0
