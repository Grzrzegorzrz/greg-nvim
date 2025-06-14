return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup {
      size = 17,
      -- alt functionality for below exists in remap.lua
      open_mapping = [[<c-/>]],
    }
  end,
}
