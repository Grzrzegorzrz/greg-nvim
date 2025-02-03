--vim.env.PATH = vim.env.PATH .. '/usr/lib/jdt-language-server-latest/bin'

require("config.lazy")
require("config.remap")
require("config.ascii")

-- hyprlang support
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- theme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g["gruvbox_material_background"] = "material"
vim.g["gruvbox_material_colors_override"] = {fg0 = {'#daccad', '234'}}
vim.cmd([[colorscheme gruvbox-material]])
--vim.cmd([[colorscheme gruvbox]])

-- enables line numbering
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.iskeyword:remove("_") -- makes "_" a word delimiter

-- tab to 2 spaces
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 10

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.hidden = true

vim.opt.cmdheight = 0  -- hides commandline

-- nvim-tree

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- misc plugin setups
require('Comment').setup()
require('mason').setup()
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

require("config.colours")

-- quickscope
--vim.g["qs_highlight_on_keys"] = {'f', 'F', 't', 'T'}
vim.g["qs_buftype_blacklist"] = {'terminal', 'nofile'}
vim.g["qs_filetype_blacklist"] = {'text'}
vim.g['qs_delay'] = 0
-- quickscope highlight colours
vim.api.nvim_set_hl(0, 'QuickScopePrimary', { fg = '#B0E0E6', underline=true, ctermfg=155, cterm = {bold=true} })
vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { fg = '#e7c3fe', underline=true, ctermfg=155, cterm = {bold=true} })
