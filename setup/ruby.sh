#!/bin/bash

if ! command -v rvm &> /dev/null; then
  # Installs GPG if missing
  brew install gnupg

  # Adds Michal Papis and Piotr Kuczynski signatures
  gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

  # Installs RVM
  # backslash skips aliases
  \curl -sSL https://get.rvm.io | bash -s stable --ignore-dotfiles
  export PATH="$PATH:$HOME/.rvm/bin"

  # Install required packages
  rvm requirements

  # sugested packages by https://github.com/rbenv/ruby-build/wiki#macos
  brew install openssl@1.1 readline
  
  OPENSSL_1_1=$(brew --prefix openssl@1.1)
  export PATH="$OPENSSL_1_1/bin:$PATH"
  export LDFLAGS="-L$OPENSSL_1_1/lib"
  export CPPFLAGS="-I$OPENSSL_1_1/include"
  export PKG_CONFIG_PATH="$OPENSSL_1_1/lib/pkgconfig"
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_1_1"

  # Install a stable version of Ruby
  # command = non interactive mode for rvm
  command rvm install ruby --latest
fi
