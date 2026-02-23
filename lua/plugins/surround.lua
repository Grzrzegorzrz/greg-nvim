return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- keymaps = {
        --   visual = "<leader>s",
        --   visual_line = "<leader>S",
        --   normal = "<leader>s",
        --   normal_cur = "<leader>ss",
        --   normal_line = "<leader>S",
        --   normal_cur_line = "<leader>SS",
        -- }
      })

      vim.keymap.set("v", "<leader>s", "<Plug>(nvim-surround-visual)")
      vim.keymap.set("v", "<leader>S", "<Plug>(nvim-surround-visual-cur)")
      vim.keymap.set("n", "<leader>s", "<Plug>(nvim-surround-normal)")
      vim.keymap.set("n", "<leader>ss", "<Plug>(nvim-surround-normal-cur)")
      vim.keymap.set("n", "<leader>S", "<Plug>(nvim-surround-normal-line)")
      vim.keymap.set("n", "<leader>SS", "<Plug>(nvim-surround-normal-curr-line)")
    end
}
