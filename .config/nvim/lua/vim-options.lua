vim.opt.termguicolors = false

-- Decrease update time
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-- Number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Better editor UI
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Better editing experience
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Undo options
vim.opt.undofile = true
vim.opt.swapfile = false

-- Better buffer splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mouse
vim.opt.mouse = "a"

-- Map <leader> to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
