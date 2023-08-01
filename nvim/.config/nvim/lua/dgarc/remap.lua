vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Allow moving blocks of code after selecting them 
-- (default select key is Shift + v then j / k to select line above or below)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append nextline to end of current line, but keep cursor where it is
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor in the middle of screen when paging up or down with Ctrl + d or Ctrl + u
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle when searching for text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep currently copied text in text buffer when pasting over
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Don't allow pressing Q :^)
vim.keymap.set("n", "Q", "<nop>")

-- Allows switching between dirs
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lpref<CR>zz")

-- refactor all instances of token in current file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x a bash file you're currently working in
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd>!TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>!TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>!TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>!TmuxNavigateUp<CR>")

-- source nvim init file
vim.keymap.set("n", "<leader>sv", "<cmd>source $VIMRC<CR>")
