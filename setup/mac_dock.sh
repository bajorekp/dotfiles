#!/bin/bash

# Sets Dock default settings
defaults delete com.apple.dock
killall Dock

# Waits for the settings to be refreshed
sleep 10

# Sets pinned apps
# Remove all pinned apps
defaults write com.apple.dock persistent-apps '()'
# Add chrome
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# Add chrome
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Calendar.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# Add VS code
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# Add iTerm
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
# Add iTerm
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Utilities/Activity Monitor.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# Sets pinned directories
# Remove all pinned directories
defaults write com.apple.dock persistent-others '()'
# Add Application directory
defaults write com.apple.dock persistent-others -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict><key>tile-type</key><string>directory-tile</string></dict>'
# Add Download directory
defaults write com.apple.dock persistent-others -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$HOME/Downloads/</string><key>_CFURLStringType</key><integer>0</integer></dict></dict><key>tile-type</key><string>directory-tile</string></dict>"

# Hide recently closed applications
defaults write com.apple.dock show-recents -bool FALSE

# Refresh configuration
killall Dock

# prints Dock configuration
defaults read com.apple.dock
