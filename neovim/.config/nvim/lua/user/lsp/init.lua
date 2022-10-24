-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup lsp_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/lua/init.lua source ~/.config/nvim/lua/user/lua/init.lua
  augroup end
]]

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig failed to load")
  return
end

require ("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
