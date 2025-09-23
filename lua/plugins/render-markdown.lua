return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "Avante" },
    heading = {
      backgrounds = {
        -- 'RenderMarkdownH1Bg',
        -- 'RenderMarkdownH2Bg',
        -- 'RenderMarkdownH3Bg',
        -- 'RenderMarkdownH4Bg',
        -- 'RenderMarkdownH5Bg',
        -- 'RenderMarkdownH6Bg',
      },
      icons = {},
    },
    bullet = {
      enabled = true,
      highlight = 'RenderMarkdownH1',
      icons = { '- ' },
    }
  },
  ft = { "markdown", "Avante" },
}
