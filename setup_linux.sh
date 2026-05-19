#!/usr/bin/env bash
set -e
set -o pipefail

# Wait for any background apt/dpkg process (e.g. unattended-upgrades) to
# release its locks before we try to run apt ourselves.
wait_for_apt() {
	local locks=(
		/var/lib/apt/lists/lock
		/var/lib/dpkg/lock
		/var/lib/dpkg/lock-frontend
		/var/cache/apt/archives/lock
	)
	while sudo fuser "${locks[@]}" >/dev/null 2>&1; do
		echo "Waiting for another apt/dpkg process to finish..."
		sleep 2
	done
}

wait_for_apt
sudo apt update
wait_for_apt
sudo apt -y upgrade
# Keep packages alphabetized
wait_for_apt
sudo apt install -y \
	bat \
	btop \
	curl \
	ffmpeg \
	firefox \
	fzf \
	gh \
	git \
	jq \
	libimage-exiftool-perl \
	neovim \
	ripgrep \
	silversearcher-ag \
	speedtest-cli \
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

wait_for_apt
sudo apt -y autoremove
sudo apt -y autoclean
sudo apt -y clean

echo "Done!"
