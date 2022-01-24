#!/bin/bash

source ./config.env

# Install Homebrew packages, apps
cd $SCRIPT_ROOTDIR/homebrew
brew bundle
