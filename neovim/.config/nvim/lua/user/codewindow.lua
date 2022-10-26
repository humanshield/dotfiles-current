-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup codewindow_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/codewindow.lua source ~/.config/nvim/lua/user/codewindow.lua
  augroup end
]]

