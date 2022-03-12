#!/bin/bash

if [[ ! -d ~/Developer/dotfiles ]]; then
  git clone https://github.com/bajorekp/dotfiles.git ~/Developer/dotfiles
fi

if [[ ! -d ~/Developer/dotfiles ]]; then
  exit 1
fi
