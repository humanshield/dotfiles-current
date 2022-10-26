# Welcome to my dotfiles

This is my new attempt at managing my new and improved dotfiles.  
I'm finally updating them after the great blunder of 2017. 

## Managed software

Currently using gnu-stow to manage symLinking everything, but will also
require a few programs to be installed.

I may or may not remember to keep this updated.

* NeoVim
* tmux
* git
* fonts

## Instalization

Here I'll try and include everything to get software running.

* Neovim 
  * installing neovim:
  ```
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage

  # Optional: exposing nvim globally.
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
  nvim
  ```
    as per [Neovim Install documentation](https://github.com/neovim/neovim/wiki/Installing-Neovim)
* Fonts
  After stowing the fonts link into place, simply run `fc-cache -fv` to update
