local conf_dir = 'config.lsp.'

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
--
-- local lspconfig_defaults = require('lspconfig').util.default_config
-- lspconfig_defaults.capabilities = vim.tbl_deep_extend(
--   'force',
--   lspconfig_defaults.capabilities,
--   require('cmp_nvim_lsp').default_capabilities()
-- )
vim.lsp.config('*', {
  capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.config['*'] and vim.lsp.config['*'].capabilities or vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
  ),
})

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '<leader>bb', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set("n", "<leader>ciw", vim.lsp.buf.rename, {})
  end,
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('vtsls')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('arduino_language_server')
-- Python
vim.lsp.enable('basedpyright')
vim.lsp.enable('ruff')

-- configs
vim.lsp.config['lua_ls'] = require(conf_dir .. 'lua_ls')
