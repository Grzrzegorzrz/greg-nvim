local M = {}

function M.highlight(theme)
  if theme == "gruvbox-material" then
    theme = { primary = '#B0E0E6', secondary = '#e7c3fe', search = '#e1b968'}
  elseif theme == "retrobox" then
    theme = { primary = '#95e5a8', secondary = '#e9b2c0', search = '#e1a53b', cur_search = '#fb6a4f'}
  end

  -- quickscope highlight colours
  vim.api.nvim_set_hl(0,
  'QuickScopePrimary', {
    fg = theme.primary,
    underline=true,
    ctermfg=155,
  })
  vim.api.nvim_set_hl(0,
  'QuickScopeSecondary', {
    fg = theme.secondary,
    underline=true,
    ctermfg=155,
  })

  -- search colouring
  vim.api.nvim_set_hl(0,
  'Search', {
    ctermbg = 222,
    bg = theme.search,
    ctermfg = 235,
    fg = '#282828',
  })

  if theme.cur_search then
    -- cterm=bold ctermfg=234 ctermbg=203 gui=bold guifg=#1c1c1c guibg=#fb4934
    vim.api.nvim_set_hl(0,
    'CurSearch', {
      ctermbg = 222,
      bg = theme.cur_search,
      ctermfg = 235,
      fg = '#282828',
    })
  end
end

return M
