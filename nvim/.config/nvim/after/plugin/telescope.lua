local builtin = require('telescope.builtin')

require('telescope').setup {
    pickers = {
        buffers = {
            sort_mru = true,
        },
    },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader><C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
