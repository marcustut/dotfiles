#!/usr/bin/env bash
# Apply catppuccin flavor matching macOS appearance.
#
# Catppuccin's theme files use `set -ogq @thm_*` (the -o = "set only if unset"),
# so a plain reload never repaints — the @thm_* vars already exist from the
# previous flavor and -o refuses to overwrite. We unset them first, then let
# the plugin re-source the correct flavor. This makes prefix+r switch live,
# instead of needing a full `tmux kill-server`.
#
# AppleInterfaceStyle key exists only in Dark mode; absent == Light.

set -euo pipefail

PLUGIN="$HOME/.config/tmux/plugins/tmux/catppuccin.tmux"

if [ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]; then
  flavor="macchiato"
else
  flavor="latte"
fi

# Clear cached theme vars so the flavor file's -o sets actually apply.
tmux show -g 2>/dev/null | grep -o '@thm_[a-z_]*' | sort -u | while read -r v; do
  tmux set -gu "$v" 2>/dev/null || true
done

tmux set -g @catppuccin_flavor "$flavor"
tmux run-shell "$PLUGIN"
