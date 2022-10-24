-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup telescope_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/telescope.lua source ~/.config/nvim/lua/user/telescope.lua
  augroup end
]]

