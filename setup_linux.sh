#!/usr/bin/env bash
# Don't forget to run as root!
set -e
set -o pipefail

cd
apt update || true
apt -y upgrade
apt install -y \
    chromium-browser \
	git \
	htop \
	python \
	python3-pip \
	silversearcher-ag \
	tmux

apt autoremove
apt autoclean
apt clean
