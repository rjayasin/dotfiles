#!/usr/bin/env bash
set -e
set -o pipefail

sudo apt install -y curl git
git clone https://github.com/rjayasin/dotfiles.git ~/dotfiles
~/dotfiles/setup_linux.sh
