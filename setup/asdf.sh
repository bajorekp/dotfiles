#!/bin/bash

# Installs asdf https://github.com/asdf-vm/asdf
brew install asdf

# Enables supported languages
asdf plugin add ruby   https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add python https://github.com/danhper/asdf-python.git

ln -sf $HOME/Developer/dotfiles/asdf/.asdfrc $HOME/.asdfrc
