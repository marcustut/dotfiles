if status is-interactive
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
    set -Ua fish_user_paths $HOME/.cargo/bin # cargo
    source $HOME/.local/bin/env.fish         # add .local/bin to PATH
    set -gx EDITOR 'nvim'                    # set nvim as editor
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
