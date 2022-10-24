-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup plugins_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/plugins.lua source ~/.config/nvim/lua/user/plugins.lua | PackerSync
  augroup end
]]


local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("failed to call packer")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" 		-- Have packer manage itself
  use "nvim-lua/popup.nvim" 		-- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" 		-- Useful lua functions used ny lots of plugins
  use "tpope/vim-git"
  use "tpope/vim-surround"
  use "tpope/vim-repeat"
  use "tpope/vim-commentary"
  --use "w0rp/ale"

-- Colorscheme
  use "chriskempson/vim-tomorrow-theme"

-- cmp plugins
  use "hrsh7th/nvim-cmp"               -- the completion plugin
  use "hrsh7th/cmp-buffer"             -- buffer completions
  use "hrsh7th/cmp-path"               -- path completions
  use "hrsh7th/cmp-cmdline"            -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"        -- snippet completions
  use "petertriho/cmp-git"              -- git commits, issues, merge/pull requests, mentions, etc
  use "tamago324/cmp-zsh"
  use "andersevenrud/cmp-tmux"
  use "delphinus/cmp-ctags"
  use "hrsh7th/cmp-nvim-lua"            -- Neovim's Lua API
  --use "ray-x/cmp-treesitter"

-- telescope plugins


-- LSP pligins
use "neovim/nvim-lspconfig"
use "williamboman/nvim-lsp-installer"

-- snippits
  use "L3MON4D3/LuaSnip"                -- snippet engine
  use "rafamadriz/friendly-snippets"    -- a bunch of snippets to use

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
