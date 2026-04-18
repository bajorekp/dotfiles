#!/bin/bash

# Installs mise that is replacement for asdf and universal package manager
brew install mise

# Enables supported languages
mise install node@lts
mise install node
mise install ruby
mise use elixir
  mise install elixir
mise install python
  mise use uv
  mise install uv
mise install go

eval "$(mise activate zsh)"