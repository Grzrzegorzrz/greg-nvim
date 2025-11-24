return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup {
      size = 17,
      -- open terminal in CWD
      open_mapping = [[<A-;>]],
    }
    -- open terminal in the directory of the file
    vim.keymap.set({"t", "n"}, "<C-;>", function() vim.cmd [[ToggleTerm dir=%:p:h<CR>]] end)
  end,
}
