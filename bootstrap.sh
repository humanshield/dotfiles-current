#!/usr/bin/env bash
# I need to update this to something like a makefile, but this is working for me for now.

# SymLink neovim configuration
#   No need for anything extra
rm ~/.config/nvim
ln -s ~/src/dotfiles/neovim_config-lua/ ~/.config/nvim

# SymLink git master configurations
rm ~/.config/git
ln -s ~/src/dotfiles/gitconfig/ ~/.config/git

# SymLink my prefered fonts, and then update cache
rm ~/.fonts
ln -s ~/src/dotfiles/fonts ~/.fonts
#fc-cache -f -v
