local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-/>', builtin.find_files, {})

vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
vim.keymap.set('n', '<C-.>', builtin.oldfiles, {})

vim.keymap.set('n', '<leader>fe', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<C-\'>', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
