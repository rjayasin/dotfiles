#!/usr/bin/env bash
set -e
set -o pipefail

# Homebrew 6 asks for confirmation before installing by default; disable
# that so the script runs unattended (apt install -y equivalent)
export HOMEBREW_NO_ASK=1

# Install Homebrew (NONINTERACTIVE skips its confirmation prompt)
if ! command -v brew &> /dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make brew available in this shell (Apple Silicon vs Intel install paths)
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

brew update
# Keep packages alphabetized
brew install \
	bat \
	btop \
	duti \
	exiftool \
	eza \
	ffmpeg \
	fzf \
	gh \
	gifsicle \
	git-delta \
	git-filter-repo \
	go \
	jq \
	lftp \
	mosh \
	ncdu \
	neovim \
	openjdk \
	openssh \
	qemu \
	ripgrep \
	rsync \
	screenfetch \
	tree \
	typescript \
	uv \
	watch \
	yarn \
	yt-dlp

# Keep casks alphabetized; --adopt takes ownership of apps that were
# installed manually instead of failing on them
brew install --cask --adopt \
	firefox \
	iterm2

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Symlink dotfiles
make -C "$(dirname "$0")" sync

# macOS defaults
# Hold-to-repeat keys instead of the press-and-hold accent popup
defaults write -g ApplePressAndHoldEnabled -bool false

# Remove the Dock auto-hide delay; only restart the Dock if the value changed
if [ "$(defaults read com.apple.dock autohide-delay 2> /dev/null)" != "0" ]; then
    defaults write com.apple.dock autohide-delay -float 0
    killall Dock
fi

brew autoremove
brew cleanup

echo "Done!"
