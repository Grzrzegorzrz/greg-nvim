local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-/>', builtin.find_files, {})
vim.keymap.set('n', '<C-.>', builtin.oldfiles, {})

vim.keymap.set('n', '<C-\'>', function()
  builtin.grep_string({ search = vim.fn.input("Grep CWD > ") });
end)
vim.keymap.set('n', '<A-\'>', function()
  local current_dir = vim.fn.expand('%:p:h')  -- Get the directory of the current file
  builtin.grep_string({ search = vim.fn.input("Grep Local > "), cwd = current_dir });
end)
