-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup lsp_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/lsp/init.lua source ~/.config/nvim/lua/user/lsp/init.lua
  augroup end
  set path+=**
]]

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("nvim-lsp-installer failed to load.")
  return
end

-- Register a handler that will be called for all install servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pywrite" then
    local pywrite_opts = require("user.lsp.settings.pywrite")
    opts = vim.tbl_deep_extend("force", pywrite_opts, opts)
  end

  if server.name == "marksman" then
    local marksman_opts = require("user.lsp.settings.marksman")
    opts = vim.tbl_deep_extend("force", marksman_opts, opts)
  end


  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
