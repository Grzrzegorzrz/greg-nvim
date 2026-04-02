local dap = require("dap")
-- local dap_utils = require("dap.utils")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {"/lib/js-debug/dapDebugServer.js", "${port}"},
  }
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = 'node',
    request = 'attach',
    name = 'Attach to process',
    port = 9229,
    address = '127.0.0.1',
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach to Node (pick port)",
    port = function()
      return tonumber(vim.fn.input("Port: ", ""))
    end,
  }
}
dap.configurations.typescript = dap.configurations.javascript
