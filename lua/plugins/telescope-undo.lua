return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require("telescope").setup({
      -- the rest of your telescope config goes here
      extensions = {
        undo = {
          -- telescope-undo.nvim config, see below
          -- mappings = {
          --   ["<C-r>"] = require("telescope-undo.actions").restore,
          -- }
        },
        -- other extensions:
        -- file_browser = { ... }
      },
    })
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  end,
}
