#!/usr/bin/env bash

# SymLink neovim configuration
#   No need for anything extra
ln -s ~/src/dotfiles/neovim_config-lua/ ~/.config/nvim

# SymLink git master configurations
ln -s ~/src/dotfiles/gitconfig/ ~/.config/git

# SymLink my prefered fonts, and then update cache
ln -s ~/src/dotfiles/fonts ~/.fonts
fc-cache -f -v
