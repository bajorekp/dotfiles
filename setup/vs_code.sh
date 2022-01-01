#!/bin/bash

# Overwrite config
ln -sf $HOME/Developer/dotfiles/vs_code/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

# Create symlink to enable `code` command
ln -s "/opt/homebrew/bin/code" "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"

# Restore extensions
# To backup extensions issue: code --list-extensions > vscode_extensions_list.txt
for extension_id in `cat vscode_extensions_list.txt`; do; code --install-extension $extension_id; done
