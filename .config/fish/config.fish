if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
end

starship init fish | source
zoxide init fish | source

fish_add_path /home/ajay/.spicetify
export PATH="$HOME/.local/bin:$PATH"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -xU EDITOR nvim
set -xU VISUAL nvim
