-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup colorscheme_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/colorscheme.lua source ~/.config/nvim/lua/user/colorscheme.lua
  augroup end
]]


local colorscheme = "Tomorrow-Night-Bright"

local status_ok, _ = pcall(vim.cmd, "colorscheme " ..colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  vim.cmd "colorscheme slate"
  return
end
