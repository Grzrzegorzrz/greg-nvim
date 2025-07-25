--vim.env.PATH = vim.env.PATH .. '/usr/lib/jdt-language-server-latest/bin'

require("config.remap")
require("config.autocommands")
require("config.lazy")
require("config.alpha")

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

-- enables line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- tab to 2 spaces
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.iskeyword:remove("_") -- makes "_" a word delimiter
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = true -- <C-l> to clear highlighting
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.hidden = true
vim.opt.cmdheight = 0  -- 0 hides commandline

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({ virtual_text = true })

-- misc plugin setups
require('Comment').setup()
require('mason').setup()
require("config.colours")

-- quickscope
vim.g["qs_buftype_blacklist"] = {'terminal', 'nofile'}
vim.g["qs_filetype_blacklist"] = {'text'}
vim.g['qs_delay'] = 0

require("config.highlight")
