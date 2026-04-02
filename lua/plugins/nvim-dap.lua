return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "leoluz/nvim-dap-go",
    "igorlfs/nvim-dap-view",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapview = require("dap-view")

    dapview.setup({
      windows = {
        position = "right",
        size = 0.4,
      },
    })

    require("dap-go").setup()
    require("nvim-dap-virtual-text").setup()

    -- -- eval var under cursor
    -- vim.keymap.set("n", "<leader>?", function()
    --   require("dapview").eval(nil, { enter = true })
    -- end)

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>d;", dapview.toggle)
    vim.keymap.set("n", "<leader>dd", dap.run_to_cursor)

    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>dl", dap.step_into) -- into func
    vim.keymap.set("n", "<leader>dj", dap.step_over) -- skip func
    vim.keymap.set("n", "<leader>dh", dap.step_out)  -- when in func, leave
    vim.keymap.set("n", "<leader>du", dap.step_back) -- undo
    -- vim.keymap.set("n", "<leader>dw", dap.watch)

    dap.listeners.before.attach.dapui_config = function()
      dapview.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapview.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapview.open()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapview.open()
    end
  end,
}
