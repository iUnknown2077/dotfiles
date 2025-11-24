-- Options
local set = vim.opt

-- Appearance
set.termguicolors = true

-- Decrease update time
set.timeoutlen = 300
set.updatetime = 250

-- Number of screen lines to keep above and below the cursor
set.scrolloff = 8

-- Better editor UI
set.number = true
set.numberwidth = 4
set.signcolumn = "yes"
set.cursorline = true

-- Better editing experience
set.expandtab = true
set.autoindent = true
set.wrap = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = -1
set.list = true
set.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Makes neovim and host OS clipboard play nicely with each other
set.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

-- Undo options
set.undofile = true
set.swapfile = false

-- Better buffer splitting
set.splitright = true
set.splitbelow = true

-- Mouse
set.mouse = "a"
