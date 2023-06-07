vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.laststatus = 3
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true;
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- [[ Setting options ]]
-- See `:help vim.o`
-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
