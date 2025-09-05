local M = {}

function M.set_theme(theme)
  vim.cmd.colorscheme(theme)

  if theme == "gruvbox-material" then
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_background = "material"
    vim.g.gruvbox_material_colors_override = {fg0 = {'#daccad', '234'}}
    theme = { primary = '#B0E0E6', secondary = '#e7c3fe' }

  elseif theme == "retrobox" then
    theme = { primary = '#95e5a8', secondary = '#e9b2c0'}

  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  require("config.highlight").highlight(theme)
end

return M
