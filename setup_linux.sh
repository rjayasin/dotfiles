#!/usr/bin/env bash
# Don't forget to run as root!
set -e
set -o pipefail

cd
apt update || true
apt -y upgrade
apt install -y \
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
chsh -s "$(which zsh)"

apt autoremove
apt autoclean
apt clean

echo "Done!"
