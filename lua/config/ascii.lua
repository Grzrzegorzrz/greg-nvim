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
   dashboard.button("y", "  Yazi", ":Yazi <CR>"),
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
   dashboard.button("r", "󰦛  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
   dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
}

local function footer()
 math.randomseed(os.time())

 -- footer pool
 local footer_values = {
  "Still T.L.E.",
  "Remember that grades are more important than mental health <3",
  "I use Neovim btw",
  "I will never get my nvim conf time back",
  "Almost as good as Emacs",
 }

 return footer_values[math.random(#footer_values)]
end

dashboard.section.footer.val = footer()

-- text colours
dashboard.section.footer.opts.hl = "Title"
dashboard.section.header.opts.hl = "Title"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
