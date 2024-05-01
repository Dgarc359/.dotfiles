-- line numbers
vim.opt.nu = true
--vim.opt.relativenumber = true

-- indent handling
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- wordwrap
vim.opt.wrap = true

-- vim undotree persistence
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- never have less than 8 lines below unless at EOF
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- fast updates
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
