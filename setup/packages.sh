#!/bin/bash

source ./config.env

# Install Homebrew packages, apps
cd -v $SCRIPT_ROOTDIR/homebrew
brew bundle
