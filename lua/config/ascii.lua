local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

[[   __    __                   __     __ __                ]],
[[  |  \  |  \                 |  \   |  \  \               ]],
[[  | ▓▓\ | ▓▓ ______   ______ | ▓▓   | ▓▓\▓▓______ ____    ]],
[[  | ▓▓▓\| ▓▓/      \ /      \| ▓▓   | ▓▓  \      \    \   ]],
[[  | ▓▓▓▓\ ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\\▓▓\ /  ▓▓ ▓▓ ▓▓▓▓▓▓\▓▓▓▓\  ]],
[[  | ▓▓\▓▓ ▓▓ ▓▓    ▓▓ ▓▓  | ▓▓ \▓▓\  ▓▓| ▓▓ ▓▓ | ▓▓ | ▓▓  ]],
[[  | ▓▓ \▓▓▓▓ ▓▓▓▓▓▓▓▓ ▓▓__/ ▓▓  \▓▓ ▓▓ | ▓▓ ▓▓ | ▓▓ | ▓▓  ]],
[[  | ▓▓  \▓▓▓\▓▓     \\▓▓    ▓▓   \▓▓▓  | ▓▓ ▓▓ | ▓▓ | ▓▓  ]],
[[   \▓▓   \▓▓ \▓▓▓▓▓▓▓ \▓▓▓▓▓▓     \▓    \▓▓\▓▓  \▓▓  \▓▓  ]],
                                                      
}

 dashboard.section.buttons.val = {
   dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "Almost better than Emacs"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Title"
dashboard.section.header.opts.hl = "Title"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
