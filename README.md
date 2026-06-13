# dotfiles

## Quick setup

```sh
git clone --recurse-submodules git@github.com:marcustut/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --no-folding -t "$HOME" .config
```

`.config` is the only stow package — keeps `.git`, `README.md`, and other
repo metadata out of `$HOME`.

### Claude Code config

Only core config is tracked (`settings.json`, `CLAUDE.md`, `RTK.md`); state,
caches, credentials, and `settings.local.json` are gitignored. `~/.claude`
already holds live state, so link the tracked files individually rather than
stowing the whole dir:

```sh
for f in settings.json CLAUDE.md RTK.md; do
  ln -sf "$PWD/.claude/$f" "$HOME/.claude/$f"
done
```
