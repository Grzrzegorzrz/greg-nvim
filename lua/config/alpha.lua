local theta = require("alpha.themes.theta")
theta.mru_opts.autocd = true

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
  {
    type = "group",
    val = {
      dashboard.button("y", "  Yazi", ":Yazi <CR>"),
      dashboard.button("o", "  Obsidian", ":edit ~/Documents/obsidian/school/index.md<CR>:cd %:p:h<CR>8j:Obsidian workspace school<CR>"),
      dashboard.button("a", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "󰦛  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("n", "  Neovim Configuration", ":e ~/.config/nvim/init.lua <CR> :cd %:p:h <CR>"),
      dashboard.button("h", "  Hyprland Configuration", ":e ~/.config/hypr/hyprland.conf <CR> :cd %:p:h <CR>"),
      dashboard.button("A", "󰀫  Alpha", ":e ~/.config/nvim/lua/config/alpha.lua <CR> :cd %:p:h <CR>"),
      dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
    },
    opts = {
      spacing = 0
    }
  },

  {
    type = "text",
    val = "Recent files",
    opts = {
      hl = "SpecialComment",
      shrink_margin = false,
      position = "center",
    },
  },

  {
    type = "group",
    val = function()
      return { theta.mru(0, nil, 14, theta.mru_opts) } -- start, cwd, # files, opts
    end,
    opts = {
      shrink_margin = false,
    },
  },
}

-- TODO: don't hardcode this
if Hyprland ~= true then
  table.remove(buttons, 8)
end

dashboard.section.buttons.val = buttons

local function footer()
  math.randomseed(os.time())

  -- footer pool
  local footer_values = {
    "Still T.L.E.",
    "Remember that grades are more important than mental health <3",
    "I use Neovim btw",
    "Almost as good as Emacs",
  }

  return footer_values[math.random(#footer_values)]
end

dashboard.section.footer.val = footer()

-- text colours
dashboard.section.footer.opts.hl = "Title"
dashboard.section.header.opts.hl = "Title"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = false
alpha.setup(dashboard.opts)
