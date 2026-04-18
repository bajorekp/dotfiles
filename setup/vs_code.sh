#!/bin/bash

# Overwrite config
ln -sf $HOME/Developer/dotfiles/vs_code/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

# Create symlink to enable `code` command
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /opt/homebrew/bin/code

# Set VS Code as default for various file types.
# Requires duti: brew install duti
editor_id=`osascript -e 'id of app "Visual Studio Code"'`
extensions=(
  c h cpp hpp
  py ipynb ini
  js ts jsx tsx
  rb erb gemfile gemspec rakefile rake rdoc spec
  ex eex ejs erl
  java go rs ru php
  tf tpl tmpl
  css scss sass svg
  json yaml yml xml toml csv
  md mdx txt log
  sh zsh bash profile zshrc
  sql
  env example sample
  gitconfig gitignore
)
for ext in "${extensions[@]}"; do
  duti -s $editor_id .$ext all
done

executables=(
  public.shell-script
  public.python-script
  public.ruby-script
  public.perl-script
  public.unix-executable
  public.script
  com.netscape.javascript-source
  com.apple.applescript.text
)
for exe in "${executables[@]}"; do
  duti -s $editor_id "$exe" all
done

# Restore extensions
cd $HOME/Developer/dotfiles/vs_code
# To backup extensions issue: code --list-extensions > vscode_extensions_list.txt
for extension_id in `cat vscode_extensions_list.txt`; do
  code --install-extension $extension_id
done
