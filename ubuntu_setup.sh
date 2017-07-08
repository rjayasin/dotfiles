#!/usr/bin/env zsh

# Don't forget to run as root!

cd
apt-get update && apt-get -y upgrade
apt-get -y install python tmux git htop

git init .
git remote add origin https://github.com/rjayasin/dotfiles.git
git pull origin master
