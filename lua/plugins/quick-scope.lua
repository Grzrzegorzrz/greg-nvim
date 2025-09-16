return {
  'unblevable/quick-scope',
  config = function()
    vim.g["qs_filetype_blacklist"] = {'text'}
    vim.g["qs_buftype_blacklist"] = {'terminal', 'nofile'}
    vim.g['qs_delay'] = 0
  end
}
