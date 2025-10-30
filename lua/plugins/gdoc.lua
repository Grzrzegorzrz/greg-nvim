return {
  'aadv1k/gdoc.vim',
  run = './install.py',
  config = function()
    vim.g.path_to_creds = '~/Documents/gdoc/credentials.json'
    vim.g.gdoc_file_path = '~/Documents/gdoc/'
    vim.g.token_directory = '~/Documents/gdoc/'
  end,
}
