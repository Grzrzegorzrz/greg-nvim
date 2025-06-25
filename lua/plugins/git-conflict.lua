return {
  'akinsho/git-conflict.nvim', version = "*",
  config = function()
    require('git-conflict').setup {
      default_mappings = {
        ours = 'co',
        theirs = 'ct',
        none = 'c0',
        both = 'cb',
        next = 'cn',
        prev = 'cp',
      },
      default_commands = true,
      disable_diagnostics = false,
      debug = false,
      list_opener = 'copen', -- command or function to open the conflicts list
      highlights = { -- They must have background color, otherwise the default color will be used
        current = 'DiffChange',
        incoming = 'DiffAdd',
      }
    }
  end
}
