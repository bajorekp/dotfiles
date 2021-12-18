#!/bin/bash

set -o xtrace

# Creates config.env if missing
cp -nv config.env.sample config.env

# Sets root dir if it is not set
SCRIPT_ROOTDIR=$(realpath $(dirname $0))
sed -i '' "s+__SET_DOTFILES_ROOTDIR_PATH__+$SCRIPT_ROOTDIR+g" ./config.env

