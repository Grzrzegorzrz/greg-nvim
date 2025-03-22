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

-- scroll screen up/down
vim.keymap.set("n", "<C-N>", "<C-E>")
vim.keymap.set("n", "<C-P>", "<C-Y>")

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

-- asbjornHaland's system clipboard map
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")    -- doesn't seem to work like Y atm
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

vim.keymap.set("i", "<C-c>", "<ESC>")

-- primeagen's rename all occurences, modded
vim.keymap.set("n", "<leader>ciw", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>CIW", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") -- ngl I don't remember what I changed in this one

-- plugins:
vim.keymap.set("n", "<leader>np", function() vim.cmd [[Telescope neoclip]] end)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>d", vim.cmd.DiffviewOpen)
vim.keymap.set("n", "<leader>r", function() vim.cmd [[Rest run]] end)

-- from neoclip
    -- (while in neoclip menu) <cr> -> paste highlighted
    -- (while in neoclip menu) <c-cr> -> select highlighted

-- from telescope.lua
    -- leader ff to find file
    -- leader fe to find word
