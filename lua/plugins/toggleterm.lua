return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup {
      size = 17,
      open_mapping = [[<c-/>]],
    }
  end,
}
