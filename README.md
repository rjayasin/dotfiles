# dotfiles

Personal dotfiles and system configuration.

## Contents

- `.vimrc`, `.zshrc`, `.gitconfig`, `.gitignore_global` — config files
- `settings.json` — VS Code settings
- `setup_mac.sh` — installs Homebrew, packages, oh-my-zsh, symlinks dotfiles, and sets macOS defaults

## Fresh install

On a new machine, run:

```sh
git clone https://github.com/rjayasin/dotfiles.git ~/src/dotfiles
~/src/dotfiles/setup_mac.sh
```

(Linux setup lives in the nas-scripts repository.)

## Usage

Symlink dotfiles to your home directory:

```sh
make sync
```

Remove symlinks:

```sh
make clean
```
