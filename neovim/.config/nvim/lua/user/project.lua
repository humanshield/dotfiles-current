-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup project_nvim_user_config
    autocmd!
    autocmd BufWritePost projects_nvim.lua source <afile> | PackerSync
  augroup end
]]

