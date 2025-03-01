local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
  },
}

M.config = function()
  local cmp = require("cmp")
  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-l>"] = cmp.mapping.confirm({ select = true }),

      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --["<leader><CR>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-BS>"] = cmp.mapping.abort(),

      -- up and down movements, pick your poison
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ["<C-S-tab>"] = cmp.mapping(cmp.mapping.select_prev_item(),{ 'i', 'c' }),

      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ["<C-tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" }, -- For luasnip users.
      -- { name = "orgmode" },
    }, {
      { name = "buffer" },
      { name = "path" },
    }),
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
