# dotfiles

Stow-managed dotfiles, split into per-OS packages so one repo serves both
macOS and Linux (Omarchy):

| Package  | Stowed on        | Contents                                                        |
| -------- | ---------------- | --------------------------------------------------------------- |
| `shared` | everywhere       | `fish`                                                          |
| `macos`  | macOS only       | `aerospace`, `yabai`, `.simplebarrc`, `ghostty`, `tmux`, `nvim` (submodule) |
| `linux`  | Linux / Omarchy  | `hypr`, `waybar`, `swayosd`, `alacritty`, `kitty`, `ghostty`, `tmux` |

Each package mirrors `$HOME`, so its contents land at `~/.config/<app>` (and
`~/.simplebarrc` for the macOS menu bar). `--no-folding` keeps `~/.config`
a real directory so `shared` and the OS package can coexist inside it.

Only `fish` is shared: omarchy ships no fish config and uses bash, so fish is
entirely ours. `ghostty` and `tmux` are kept **per-OS** because omarchy themes
and ships its own versions on Linux (the Linux `ghostty` pulls omarchy's dynamic
theme via `config-file = ?"~/.config/omarchy/current/theme/ghostty.conf"`).
`nvim` is the personal `init.lua` submodule on macOS only; on Linux, omarchy's
themed LazyVim owns it (installed via `omarchy-nvim-setup`, not tracked here).

## Quick setup

```sh
git clone --recurse-submodules git@github.com:marcustut/dotfiles.git ~/dotfiles
cd ~/dotfiles

# macOS
stow --no-folding -t "$HOME" shared macos

# Linux / Omarchy
stow --no-folding -t "$HOME" shared linux
```

Stow refuses to overwrite existing real files. On a machine that already has
configs in place (e.g. a fresh Omarchy install ships its own `~/.config/hypr`
etc.), move them aside first:

```sh
mv ~/.config/hypr ~/.config/hypr.orig   # repeat per conflicting app, then stow
```

After stowing on Omarchy, apply the changes: `hyprctl reload`,
`omarchy restart waybar`. For nvim, run `omarchy-nvim-setup` to install
omarchy's themed LazyVim (it is not part of this repo).

### Migrating from the old single-`.config` layout

If a machine was set up with the previous `stow ... .config` command, unstow it
before adopting the new packages:

```sh
cd ~/dotfiles && git stash    # if needed; checkout the pre-split commit
stow -D -t "$HOME" .config    # remove old links
# then pull the new layout and stow shared + your OS package
```

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

## Notes

- **tmux prefix:** `C-a` locally, `C-b` inside an SSH session (so a nested
  remote tmux doesn't collide with the local one). Set in both the macOS and
  Linux `tmux.conf`.
- **`linux/.config/hypr/monitors.conf`** is machine-specific (display
  names/resolutions) — adjust per machine after stowing.
- **nvim on Linux** is omarchy's LazyVim, not this repo. Restore it with
  `omarchy-nvim-setup`; its colorscheme follows `omarchy theme set`.
