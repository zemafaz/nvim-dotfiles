vim.o.syntax = "on"

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.mouse = 'a'
vim.o.wrap = false

vim.g.mapleader = " "

-- Warning column always visible
vim.o.signcolumn = "yes"

-- Window splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Set persistent undo
vim.o.undofile = true

-- Use system clipboard
vim.opt.clipboard="unnamedplus"

-- Number of min lines above/under cursor
vim.opt.scrolloff=8

-- Enable 24 bit RGB color
vim.o.termguicolors = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.signcolumn = "yes"

vim.g.netrw_banner = 0

vim.opt.inccommand="split"

vim.opt.cursorline = true
