if status is-interactive
    ################################
    #                              #
    #           Prompt             #
    #                              #
    ################################
    # See docs: <https://pure-fish.github.io/pure>
    set -U pure_show_system_time false
    set -U pure_show_prefix_root_prompt true
    set -U pure_enable_single_line_prompt true
    set -U pure_show_numbered_git_indicator true
    set -U pure_show_jobs true
    set -U pure_enable_k8s true

    ################################
    #                              #
    #           Keymode            #
    #                              #
    ################################
    fish_vi_key_bindings # vi mode (default insert)

    ################################
    #                              #
    #           Aliases            #
    #                              #
    ################################
    alias k="kubectl"
    alias kns="kubens"
    alias kctx="kubectx"
    alias vim="nvim"
    alias g="git"
    alias grep="rg"
    alias mkdir="mkdir -p"
    alias cp="cp -v"
    alias mv="mv -v"
    alias rm="rm -v"
    alias ls="eza --icons"
    alias lla="eza -lah --icons"
    alias cat="bat --paging=never --style=plain"

    ################################
    #                              #
    #        Abbreviations         #
    #                              #
    ################################
    abbr --add reload source ~/.config/fish/config.fish

    # cargo
    abbr --add cb cargo build
    abbr --add cc cargo check
    abbr --add cdo cargo doc --open
    abbr --add cr cargo run

    # git
    abbr --add gaa git add -A
    abbr --add ga git add
    abbr --add gbd git branch --delete
    abbr --add gb git branch
    abbr --add gc git commit
    abbr --add gcm git commit -m
    abbr --add gcob git checkout -b
    abbr --add gco git checkout
    abbr --add gd git diff
    abbr --add gl git log
    abbr --add gp git push
    abbr --add gpom git push origin main
    abbr --add gs git status
    abbr --add gst git stash
    abbr --add gstp git stash pop

    ################################
    #                              #
    #         Environment          #
    #                              #
    ################################
    set -Ua fish_user_paths $HOME/.cargo/bin           # cargo
    source $HOME/.local/bin/env.fish                   # add .local/bin to PATH
    set -gx EDITOR 'nvim'                              # set nvim as editor
    fish_add_path /opt/homebrew/opt/postgresql@16/bin  # add postgresql binaries to PATH

    # configure openssl for compilers
    set -x LDFLAGS "-L$(brew --prefix openssl@3)/lib $LDFLAGS"
    set -x CPPFLAGS "-I$(brew --prefix openssl@3)/include $CPPFLAGS"
    set -x PKG_CONFIG_PATH "$(brew --prefix openssl@3)/lib/pkgconfig $PKG_CONFIG_PATH"
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r $HOME/.opam/opam-init/init.fish && source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# END opam configuration

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
