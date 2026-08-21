#!/usr/bin/env bash
set -e
set -o pipefail

# Use apt-get (stable scripting CLI), block on dpkg lock instead of failing
# if unattended-upgrades is running, and run non-interactively so the
# upgrade doesn't stall on tzdata/grub-style prompts.
export DEBIAN_FRONTEND=noninteractive
APT=(sudo apt-get -y -o DPkg::Lock::Timeout=-1)

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

# Install yt-dlp from release binary
YT_DLP="$HOME/.local/bin/yt-dlp"
if [ -x "$YT_DLP" ]; then
    "$YT_DLP" -U
else
    mkdir -p "$(dirname "$YT_DLP")"
    curl -fsSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o "$YT_DLP"
    chmod +x "$YT_DLP"
fi

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
