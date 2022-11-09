if status is-interactive
	# Commands to run in interactive sessions can go here
	# Default NVM version
	set --universal nvm_default_version v16.16.0
end

# ----- Alias -----

alias fishconfig='nvim $HOME/.config/fish/config.fish'
alias nvimrc='nvim $HOME/.config/nvim/lua/user/init.lua'
alias vimrc='nvim $HOME/.config/nvim/lua/user/init.lua'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias vim='nvim'
alias g='git'
alias python='python3'

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# ----- Utilities -----

# If exa is installed, use it
if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end

# reload fish config
alias reload=". ~/.config/fish/config.fish && echo 'FISH config reloaded from ~/.config/fish/config.fish'"

# -----  Variables -----
set -Ux EDITOR nvim
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8
set -Ux LC_CTYPE en_US.UTF-8

# Pip
fish_add_path $HOME/Library/Python/3.8/bin

# Rust
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/Library/Caches/.wasm-pack/.wasm-bindgen-cargo-install-0.2.78/bin

# Go
set -Ux GOPATH $HOME/go
set -Ux GO111MODULE on
fish_add_path $GOPATH/bin

# Homebrew
fish_add_path /opt/homebrew/bin

# VS Code
fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add mysql-client to path
fish_add_path /opt/homebrew/opt/mysql-client/bin

# Emscripten
# . $HOME/emsdk/emsdk_env.fish

# Blender
fish_add_path /Applications/Blender.app/Contents/MacOS
alias blender='Blender'

# Android SDK
set -Ux ANDROID_HOME $HOME/Library/Android/sdk
fish_add_path $HOME/Library/Android/sdk/emulator
fish_add_path $HOME/Library/Android/sdk/tools
fish_add_path $HOME/Library/Android/sdk/tools/bin
fish_add_path $HOME/Library/Android/sdk/platform-tools

# Solana
fish_add_path $HOME/.local/share/solana/install/active_release/bin

# ----- Others -----
# startship prompt
starship init fish | source

# fish vi mode
fish_vi_key_bindings

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marcus/google-cloud-sdk/path.fish.inc' ]; . '/Users/marcus/google-cloud-sdk/path.fish.inc'; end

set -gx PNPM_HOME "/Users/marcus/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# Bun
set -Ux BUN_INSTALL "/Users/marcus/.bun"
set -px --path PATH "/Users/marcus/.bun/bin"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/marcus/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

