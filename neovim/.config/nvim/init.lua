-- RIP my own sense, 2017 - Where I forgot to initialize config sub-folder before deleting the repo and starting over
-- 2022 - re-creating configuration from scratch as I transfer over to a lua config

-- Keep organized! import form sub-folders
require('user.plugins')                       -- Plugins and plugin manager
require('user.settings')                      -- Basic options go here
require('user.keymaps')                       -- keymaps, leader-functions
require('user.colorscheme')                   -- set colorscheme
require('user.autocompletion')                -- currently using cmp
require('user.lsp')
require('user.telescope')

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- -- Adding my own bits to try and do the same for all config files
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source ~/.config/nvim/init.lua
  augroup end
]]


-- colorscheme, the simple, breakable way.
--vim.cmd "colorscheme Tomorrow-Night-Bright"

-- Pritty print lua table
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end
