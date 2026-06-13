# dotfiles

## Quick setup

```sh
git clone --recurse-submodules git@github.com:marcustut/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --no-folding -t "$HOME" .config
```

`.config` is the only stow package — keeps `.git`, `README.md`, and other
repo metadata out of `$HOME`.
