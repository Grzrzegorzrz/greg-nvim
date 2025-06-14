-- the ONLY acceptable leader
vim.g.mapleader = " "

-- line splitting and joining resp.
vim.keymap.set("n", "K", "mwi<Enter><ESC>`w") -- keep cursor pos
vim.keymap.set("n", "<C-k>", "i<Enter><ESC>")
-- ^ idea, have keybind that seperates for every instance including and after
-- current cursor character, excluding \[char]
vim.keymap.set("n", "J", "mzJ`z") -- keep cursor pos
vim.keymap.set("n", "<C-j>", "J")

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
vim.keymap.set("i", "<C-Backspace>", "<ESC>vbc")
vim.keymap.set("i", "<C-Del>", "<ESC>lvec")

-- scroll screen left/right
vim.keymap.set("n", "<C-F>", "40zl")
vim.keymap.set("n", "<C-B>", "40zh")

-- quick split window vertically
vim.keymap.set("n", "<C-s>", "<C-w><C-v>")
vim.keymap.set("v", "<C-s>", "<C-w><C-v>")

-- move to window
vim.keymap.set("n", "<leader>h", "<C-W>h")
vim.keymap.set("n", "<leader>j", "<C-W>j")
vim.keymap.set("n", "<leader>k", "<C-W>k")
vim.keymap.set("n", "<leader>l", "<C-W>l")

-- auto close curly
vim.keymap.set("i", "{", "{}<ESC>i")

vim.keymap.set("i", "<CR>", function()
    local r,c = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    if c > 0 and line:sub(c+1, c+1) == '}' then
        if vim.bo.filetype == "text" or vim.bo.filetype == "" then
            return "a<ESC>viBo<ESC><ESC>i<CR><ESC>viB<ESC><ESC>a<CR><BS><ESC>k$a<BS>"
        end
        return "a<ESC>viBo<ESC><ESC>i<CR><ESC>viB<ESC><ESC>a<CR><ESC>k$a<BS>"
    else return "<CR>"
    end
end, { expr = true })

vim.keymap.set("i", "}", function()
    local r,c = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    if c > 0 and line:sub(c, c) == '{' then
        return "<Del>}"
    else return "}"
    end
end, { expr = true })

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

-- system clipboard map
vim.keymap.set({ 'n', 'v' }, "<A-y>", "\"+y")
vim.keymap.set('i', "<A-y>", "<ESC>\"+y")
vim.keymap.set({ 'n', 'v' }, "<A-Y>", "\"+Y") -- doesn't seem to work like Y atm
vim.keymap.set('i', "<A-Y>", "<ESC>\"+Y")

vim.keymap.set({ 'n', 'v' }, "<A-p>", "\"+p")
vim.keymap.set('i', "<A-p>", "<ESC>\"+p")
vim.keymap.set({ 'n', 'v' }, "<A-P>", "\"+P")
vim.keymap.set('i', "<A-P>", "<ESC>\"+P")

-- makes Ctrl + c match esc behavior
vim.keymap.set("i", "<C-c>", "<ESC>")

-- rename all occurences
vim.keymap.set("n", "<leader>CIW", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
-- "<leader>ciw" is in after/pluging/lsp as the lsp change variable

-- plugins:
vim.keymap.set("n", "<leader>np", function() vim.cmd [[Telescope neoclip]] end)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>d", vim.cmd.DiffviewOpen)
vim.keymap.set("n", "<leader>r", function() vim.cmd [[Rest run]] end)
-- open terminal in the directory of the file
-- vim.keymap.set({"t", "n"}, "<A-/>", function() vim.cmd [[ToggleTerm dir=%:p:h<CR>]] end)

-- from neoclip
    -- (while in neoclip menu) <CR> -> paste highlighted
    -- (while in neoclip menu) <A-CR> -> select highlighted

-- from telescope.lua
    -- leader ff to find file
    -- leader fr to find recent file
    -- leader fe to find word
