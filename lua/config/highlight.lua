-- quickscope highlight colours

local M = {}

function M.highlight(theme)

  local qs_hl = theme

  vim.api.nvim_set_hl(0, 'QuickScopePrimary', {
    fg = qs_hl.primary,
    underline=true,
    ctermfg=155,
  })
  vim.api.nvim_set_hl(0,
  'QuickScopeSecondary', {
    fg = qs_hl.secondary,
    underline=true,
    ctermfg=155,
  })
end

return M
