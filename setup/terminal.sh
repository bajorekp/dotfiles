#!/bin/bash

# Setup iTerm with configuration from ~/Developer/dotfiles/iterm directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection -int 2
defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/Developer/dotfiles/iterm"
