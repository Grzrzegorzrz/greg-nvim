return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "Avante" },
    completions = { lsp = { enabled = true } },
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
    },
    checkbox = {
      custom = {
        question = {
          raw = '[~]', rendered = '󰜥 ', highlight = 'RenderMarkdownHint', scope_highlight = nil
        },
        alert = {
          raw = '[!]', rendered = '󰳤 ', highlight = 'RenderMarkdownError', scope_highlight = nil
        },
        arrow = {
          raw = '[>]', rendered = '󰧛 ', highlight = 'RenderMarkdownHint', scope_highlight = nil
        },
      },
    },
  },
  ft = { "markdown", "Avante" },
}
