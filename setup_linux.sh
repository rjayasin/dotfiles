#!/usr/bin/env bash
set -e
set -o pipefail

sudo apt update || true
sudo apt -y upgrade
sudo apt install -y \
    chromium-browser \
	curl \
	git \
	btop \
	ripgrep \
	silversearcher-ag \
	tmux \
	zsh

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Change default shell to zsh
sudo chsh -s "$(which zsh)" "$USER"

sudo apt autoremove
sudo apt autoclean
sudo apt clean

echo "Done!"
