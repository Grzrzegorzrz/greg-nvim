local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

Hyprland = false

if vim.loop.os_uname().sysname ~= "Windows" then
  if io.popen('echo $XDG_CURRENT_DESKTOP'):read() == 'Hyprland' then
    Hyprland = true
  end
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

local buttons = {
   dashboard.button("y", "  Yazi", ":Yazi <CR>"),
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
   dashboard.button("r", "󰦛  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  Neovim Configuration", ":e ~/.config/nvim/init.lua<CR>"),
   dashboard.button("h", "  Hyprland Configuration", ":e ~/.config/hypr/hyprland.conf<CR>"),
   dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
}

if Hyprland ~= true then
  table.remove(buttons, 7)
end

dashboard.section.buttons.val = buttons

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
