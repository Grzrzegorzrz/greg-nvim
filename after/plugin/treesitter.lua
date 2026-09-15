local treesitter = require("nvim-treesitter")

treesitter.setup()

treesitter.install({
  "javascript",
  "typescript",
  "java",
  "c",
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
  "hyprlang",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",
    "typescript",
    "java",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "hyprlang",
  },
  callback = function()
    vim.treesitter.start()
  end,
})
