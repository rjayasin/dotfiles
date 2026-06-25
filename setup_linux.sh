#!/usr/bin/env bash
set -e
set -o pipefail

# Use apt-get (stable scripting CLI) and run non-interactively so the
# upgrade doesn't stall on tzdata/grub-style prompts. DPkg::Lock::Timeout
# handles the dpkg lock (install/upgrade); wait_for_apt covers the apt
# lists lock (update), which DPkg::Lock::Timeout does not.
export DEBIAN_FRONTEND=noninteractive
APT=(sudo apt-get -y -o DPkg::Lock::Timeout=-1)

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
"${APT[@]}" update
"${APT[@]}" dist-upgrade
# Keep packages alphabetized
"${APT[@]}" install \
	bat \
	btop \
	curl \
	ffmpeg \
	firefox \
	fzf \
	gh \
	git \
	git-delta \
	golang \
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

"${APT[@]}" autoremove
"${APT[@]}" autoclean
"${APT[@]}" clean

echo "Done!"
