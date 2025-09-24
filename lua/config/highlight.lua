local M = {}

function M.highlight(theme)
  local qs_hl = theme

  -- quickscope highlight colours
  vim.api.nvim_set_hl(0,
  'QuickScopePrimary', {
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

  -- search colouring
  vim.api.nvim_set_hl(0,
  'Search', {
    ctermbg = 222,
    bg = '#e1b968',
    ctermfg = 235,
    fg = '#282828',
  })
end

return M
