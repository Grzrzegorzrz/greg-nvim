return {
  "m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup({
      keys = {
        ["("] = { escape = false, close = true, pair = "()" },
        ["["] = { escape = false, close = true, pair = "[]" },
        ["{"] = { escape = false, close = true, pair = "{}" },

        [">"] = { escape = true, close = false, pair = "<>" },
        [")"] = { escape = true, close = false, pair = "()" },
        ["]"] = { escape = true, close = false, pair = "[]" },
        ["}"] = { escape = true, close = false, pair = "{}" },

        ['"'] = { escape = true, close = true, pair = '""', disable_command_mode = true },
        ["'"] = { escape = true, close = true, pair = "''", disable_command_mode = true },
        ["`"] = { escape = true, close = true, pair = "``", disable_command_mode = true },
      },
      options = {
        disabled_filetypes = { "text", "markdown" },
        disable_when_touch = false,
        touch_regex = "[%w(%[{]",
        pair_spaces = false,
        auto_indent = true,
        disable_command_mode = false,
      },
    })
  end
}
