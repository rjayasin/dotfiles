# dotfiles

Personal dotfiles and system configuration.

## Contents

- `.vimrc`, `.zshrc`, `.tmux.conf`, `.gitconfig`, `.gitignore_global` — config files
- `settings.json` — VS Code settings
- `setup_linux.sh` — installs packages, zsh, oh-my-zsh, and symlinks dotfiles
- `setup_mac.sh` — installs Homebrew, packages, oh-my-zsh, symlinks dotfiles, and sets macOS defaults
- `bootstrap_linux.sh` — fresh machine setup (installs git, clones repo, runs setup)

## Fresh install

On a new Linux machine, run:

```sh
wget -qO- https://raw.githubusercontent.com/rjayasin/dotfiles/main/bootstrap_linux.sh | sh
```

On a new Mac, run:

```sh
git clone https://github.com/rjayasin/dotfiles.git ~/src/dotfiles
~/src/dotfiles/setup_mac.sh
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
