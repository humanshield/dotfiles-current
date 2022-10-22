-- ========================================
-- ==  General Settings
-- ========================================

-- Autocommand that reloads neovim whenever you save the current file
-- -- I'm sure there's a better way to do this...
vim.cmd [[
  augroup settings_user_config
    autocmd!
    autocmd BufWritePost ~/.config/nvim/lua/user/settings.lua source ~/.config/nvim/lua/user/settings.lua
  augroup end
  set path+=**
]]


-- cmd('syntax on')
--vim.api.nvim_command('filetype plugin indent on')

-- basic
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
--vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
--vim.opt.cursorline = true                       -- highlight the current line
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 3				                    -- Number of screen lines to keep above and below the cursor

vim.opt.termguicolors = true
--vim.opt.background = 'dark'

-- Do not save when switching buffers
--vim.opt.hidden = true

-- Decrease update time
vim.opt.timeoutlen = 500                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 200                        -- faster completion (4000ms default)

-- Tab stuff
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.tabstop =     2                         -- insert 2 spaces for a tab
--vim.opt.softtabstop = 2                         -- insert 2 spaces for a tab
vim.opt.shiftwidth =  2                         -- the number of spaces inserted for each indentation

-- clipboard
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard

-- backups
vim.opt.backup = false                          -- creates a backup file
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- special
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files

-- search
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns

vim.opt.list = true
vim.opt.listchars:append('tab:▸ ')
vim.opt.listchars:append('trail:-')
vim.opt.listchars:append('eol:¬')

-- menus
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

-- gutter and modeline
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 5                         -- set number column width (default 4)
vim.opt.relativenumber = true                   -- set relative nubmered lines
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.modeline = true


vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
