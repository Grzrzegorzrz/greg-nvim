return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == "horizontal" then
          return 17
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<A-;>]],
      direction = "vertical",
    }

    -- open terminal in the directory of the file
    vim.keymap.set({"t", "n"}, "<C-;>", function() vim.cmd [[ToggleTerm dir=%:p:h<CR> direction=horizontal size=17]] end)
  end,
}
