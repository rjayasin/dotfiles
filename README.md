# dotfiles

Personal dotfiles and system configuration.

## Contents

- `.vimrc`, `.zshrc`, `.gitconfig`, `.gitignore_global` — config files
- `settings.json` — VS Code settings
- `setup_linux.sh` — installs packages, zsh, oh-my-zsh, and symlinks dotfiles
- `bootstrap_linux.sh` — fresh machine setup (installs git, clones repo, runs setup)

## Fresh install

On a new machine, run:

```sh
wget -qO- https://raw.githubusercontent.com/rjayasin/dotfiles/main/bootstrap_linux.sh | sh
```

## Usage

Symlink dotfiles to your home directory:

```sh
make sync
```

Remove symlinks:

```sh
make clean
```
