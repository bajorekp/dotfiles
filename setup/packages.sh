#!/bin/bash

source ./config.env

# Install homebrew packages, apps
cd -v $SCRIPT_ROOTDIR/homebrew
brew bundle
