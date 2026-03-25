# dotfiles

Personal dotfiles and system configuration.

## Contents

- `.vimrc`, `.zshrc`, `.gitconfig`, `.gitignore_global`, `.tmux.conf` — config files
- `settings.json` — VS Code settings
- `setup_linux.sh` — Linux bootstrap script (installs packages, zsh, oh-my-zsh)

## Usage

Symlink dotfiles to your home directory:

```sh
make sync
```

Remove symlinks:

```sh
make clean
```
