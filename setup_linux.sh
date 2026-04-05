#!/usr/bin/env bash
set -e
set -o pipefail

sudo apt update || true
sudo apt -y upgrade
# Keep packages alphabetized
sudo apt install -y \
	btop \
	curl \
	ffmpeg \
	firefox \
	fzf \
	git \
	libimage-exiftool-perl \
	neovim \
	ripgrep \
	silversearcher-ag \
	speedtest-cli \
	tmux \
	tree \
	zsh

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Change default shell to zsh
sudo chsh -s "$(which zsh)" "$USER"

# Symlink dotfiles
make -C "$(dirname "$0")" sync

sudo apt autoremove
sudo apt autoclean
sudo apt clean

echo "Done!"
