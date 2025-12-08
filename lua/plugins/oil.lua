return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          local m = name:match("^%.")
          return m ~= nil
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          local m = name:match("^(%.%.?)$")
          return m ~= nil
        end,
      },
      keymaps = {
        ["<C-l>"] = "actions.select",
        ["L"] = "actions.refresh", -- temp
        ["<C-h>"] = "actions.parent",
        [","] = { "actions.change_sort", mode = "n" },
        ["<ESC>"] = { "actions.close", mode = "n" },
      },
      skip_confirm_for_simple_edits = false,
    })
    vim.keymap.set("n", "<C-h>", vim.cmd.Oil)
  end,
}
