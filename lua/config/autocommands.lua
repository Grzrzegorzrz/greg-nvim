-- I couldn't get the prettier.nvim extension working so I'm just using this
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    "*.js", "*.jsx",
    "*.ts", "*.tsx",
    "*.css", "*.scss", "*.less",
    "*.html", "*.graphql",
    "*.json", "*.yaml", "*.yml",
    "*.md",
  },
  callback = function()
    vim.cmd("silent !prettier --write %")
  end,
})
