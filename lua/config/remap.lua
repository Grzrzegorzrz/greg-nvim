-- the ONLY acceptable leader
vim.g.mapleader = " "

-- line splitting and joining resp.
vim.keymap.set("n", "K", "i<Enter><ESC>") -- keep cursor pos
vim.keymap.set("n", "<C-k>", "mwi<Enter><ESC>`w")
-- ^ idea, have keybind that seperates for every instance including and after
-- current cursor character, excluding \[char]
vim.keymap.set("n", "J", "mzJ`z") -- keep cursor pos
vim.keymap.set("n", "<C-j>", "kmzJ`z") -- join upward; move cursor pos up

vim.keymap.set("i", "}", "}<ESC>==a") -- auto format end curly
vim.keymap.set("n", "\\", "<CR>") -- iso keyboard :pensive:
                                  -- remove if not using iso keyboard

-- toggle line wrapping
vim.keymap.set("n", "<leader>w", function()
  if vim.o.wrap == true then
    vim.opt.wrap = false
  else
    vim.opt.wrap = true
  end
end)

-- quick macro
vim.keymap.set("n", "<C-Q>", "qk")
vim.keymap.set("n", "q<C-Q>", "qk")
-- tip: usable in visual line mode

-- scroll screen up/down
vim.keymap.set({ "n", "v" }, "<C-N>", "<C-E>")
vim.keymap.set({ "n", "v" }, "<C-P>", "<C-Y>")
vim.keymap.set({ "n", "v" }, "<CS-N>", "10<C-E>")
vim.keymap.set({ "n", "v" }, "<CS-P>", "10<C-Y>")

-- ctrl backspace/delete functionality
vim.keymap.set({ "i", "c" }, "<C-Backspace>", "<C-w>")
vim.keymap.set({ "i", "c" }, "<C-Del>", "<ESC>lcw")

-- scroll screen left/right
vim.keymap.set("n", "<C-F>", "40zl")
vim.keymap.set("n", "<C-B>", "40zh")

-- quick split window vertically
vim.keymap.set({"n", "v"}, "<C-s>", "<C-w><C-v>")

-- move to window
vim.keymap.set("n", "<leader>h", "<C-W>h")
vim.keymap.set("n", "<leader>j", "<C-W>j")
vim.keymap.set("n", "<leader>k", "<C-W>k")
vim.keymap.set("n", "<leader>l", "<C-W>l")

-- primeagen's move commands
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- primeagen's middle stabilizers
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- primeagen's greatest remap ever, modded
-- (pasting in visual mode doesn't override the default yank buffer)
vim.keymap.set("v", "p", "\"_dP")

-- do not yank when using c
vim.keymap.set({ "v", "n" }, "c", "\"_c")

-- system clipboard map
vim.keymap.set({ 'n', 'v' }, "<A-y>", "\"+y")
vim.keymap.set('i', "<A-y>", "<ESC>\"+y")
vim.keymap.set({ 'n', 'v' }, "<A-Y>", "\"+Y") -- doesn't seem to work like Y atm
vim.keymap.set('i', "<A-Y>", "<ESC>\"+Y")

vim.keymap.set({ 'n', 'v' }, "<A-p>", "\"+p")
vim.keymap.set('i', "<A-p>", "<ESC>\"+p")
vim.keymap.set({ 'n', 'v' }, "<A-P>", "\"+P")
vim.keymap.set('i', "<A-P>", "<ESC>\"+P")

-- paste in insert mode
vim.keymap.set('i', "<C-r>", "<C-r>\"")

-- makes Ctrl + c match esc behavior
vim.keymap.set("i", "<C-c>", "<ESC>")

-- indent in insert mode
vim.keymap.set("i", "<C-,>", function()
  local indent = vim.opt.shiftwidth:get();
  return "<ESC><<" .. indent .. "ha"
end, { expr = true })

vim.keymap.set("i", "<C-.>", function()
  local indent = vim.opt.shiftwidth:get();
  return "<ESC>>>" .. indent .. "la"
end, { expr = true })

-- rename all occurences
vim.keymap.set("n", "<leader>CIW", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- "<leader>ciw" is in after/pluging/lsp as the lsp change variable

vim.api.nvim_create_user_command('Redir', function(ctx)
  local result = vim.api.nvim_exec2(ctx.args, { output = true })
  local lines = vim.split(result.output, '\n', { plain = true })
  vim.cmd('new')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, {
nargs = '+',
complete = 'command'
})

vim.keymap.set("n", "<leader>G", vim.cmd.OpenGitUrl)

-- Obsidian keybinds
vim.keymap.set({ "n", "v" }, "<leader>o", function()
  if vim.bo.filetype ~= "markdown" then
    vim.cmd('edit ~/Documents/obsidian/school/index.md')
    vim.api.nvim_set_current_dir('~/Documents/obsidian/school')

  else
    local obsidian_cmds = {
      ['n'] = {
        ['l'] = 'links',
        ['n'] = 'new',
        ['w'] = 'workspace',
        ['o'] = 'quick_switch',
        ['f'] = 'follow_link',
        ['r'] = 'rename',
        ['b'] = 'backlinks',
        [';'] = 'tags',
        ['\'']= 'search',
        ['c'] = 'toc',
        ['m'] = '',
      },
      ['v'] = {
        ['l'] = 'link',
        ['w'] = 'workspace',
        ['o'] = 'quick_switch',
        ['f'] = 'follow_link',
        ['r'] = 'rename',
        ['b'] = 'backlinks',
        [';'] = 'tags',
        ['\'']= 'search',
        ['c'] = 'toc',
        ['m'] = '',
      },
      ['misc'] = {
        ['t'] = function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>gg/tags:<CR>eea <ESC>C<CR>  - ", true, false, true), "n", false) end,
        ['n'] = function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":Obsidian link_new ", true, false, true), 'n', false) end,
        ['i'] = function() vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":Obsidian link ", true, false, true), 'n', false) end,
      }
    }

    local mode = vim.api.nvim_get_mode().mode
    local command = vim.fn.nr2char(vim.fn.getchar())
    local choice = obsidian_cmds[mode][command]

    if choice then
      vim.cmd('Obsidian ' .. choice)
    elseif obsidian_cmds['misc'][command] then
      obsidian_cmds['misc'][command]()
    end
  end
end)

-- plugins:
vim.keymap.set("n", "<leader>np", function() vim.cmd [[Telescope neoclip]] end)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFindFileToggle)
-- open terminal in the directory of the file
vim.keymap.set({"t", "n"}, "<C-;>", function() vim.cmd [[ToggleTerm dir=%:p:h<CR>]] end)

-- from neoclip
-- (while in neoclip menu) <CR> -> paste highlighted
-- (while in neoclip menu) <A-CR> -> select highlighted

-- from telescope.lua
-- leader ff to find file
-- leader fr to find recent file
-- leader fe to find word
