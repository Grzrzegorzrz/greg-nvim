local M = {}

function M.set_theme(theme)
  vim.cmd.colorscheme(theme)

  if theme == "gruvbox-material" then
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_background = "material"
    vim.g.gruvbox_material_colors_override = {fg0 = {'#daccad', '234'}}

  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  require("config.highlight").highlight(theme)
end

return M
