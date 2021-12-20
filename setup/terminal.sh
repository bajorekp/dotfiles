#!/bin/bash

# Setup iTerm with configuration from ~/Developer/dotfiles/iterm directory
plutil -extract "PrefsCustomFolder" raw ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -remove "PrefsCustomFolder" ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -replace "PrefsCustomFolder" -string "$HOME/Developer/dotfiles/iterm" ~/Library/Preferences/com.googlecode.iterm2.plist
plutil -extract "PrefsCustomFolder" raw ~/Library/Preferences/com.googlecode.iterm2.plist
