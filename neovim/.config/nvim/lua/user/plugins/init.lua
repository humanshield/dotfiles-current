-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup plugins_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


local fn = vim.fn

-- convenience function for grabbing the config for each plugins
-- in the plugins folder
function get_setup(name)
  return string.format('require("user/plugins/%s")', name)
end

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

packer.init {
  display = {                      -- Have packer use a popup window
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

  -- project.nvim - the new Rooter
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "README.MD" },
        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},
        -- show_hidden = true,     -- Default = false
      }
    end
  }

-- cmp plugins
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "saadparwaiz1/cmp_luasnip" },
      { "petertriho/cmp-git" },
      { "tamago324/cmp-zsh" },
      { "andersevenrud/cmp-tmux" },
      { "delphinus/cmp-ctags" },
      { "hrsh7th/cmp-nvim-lua" },
      --{ "ray-x/cmp-treesitter" },
    },
    config = get_setup("cmp"),
  })

  use ({
    "nvim-telescope/telescope.nvim",
    module = 'telescope',
    cmd = "Telescope",
    requires = {
      { "nvim-lua/plenary.nvim" },
      --{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = get_setup("telescope"),
  })

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
