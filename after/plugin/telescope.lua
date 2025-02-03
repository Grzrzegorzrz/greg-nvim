local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fe', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- vim.keymap.set('n', '<C-p', builtin.git_files, {}) -- not sure what I was doing here, let's keep it broken lmao
