#!/usr/bin/env bash

# SymLink neovim configuration
#   No need for anything extra
ln -s ~/src/dotfiles/neovim_config-lua/ ~/.config/nvim

# SymLink git master configurations
ln -s ~/src/dotfiles/gitconfig/ ~/.config/git
