require("base46").get_integration "dap"
dofile(vim.g.base46_cache .. "dap")
-- stylua: ignore start
-- numhl colors the line number too
vim.fn.sign_define( "DapBreakpoint", { text = "󰙧", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define( "DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapLogPoint" })
vim.fn.sign_define( "DapStopped", { text = "", texthl = "DapStopped", numhl = "DapStopped" })
vim.fn.sign_define( "DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", numhl = "DapBreakpointRejected" })
vim.fn.sign_define( "DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", numhl = "DapBreakpointCondition" })
-- stylua: ignore end

local dap = require "dap"
local ui = require "dapui"

-- require("mason").setup()
-- check this:
-- https://github.com/ahujaankush/AetherizedDots/blob/9bf890d877145f5a93fba210bab777d4213dd7e5/.config/nvim/lua/plugins/configs/lsp/masondap.lua
-- doesn't seem to work, nvim-dap still uses system binary and not masons, disabling for now and hardcoding masons path
-- require("mason-nvim-dap").setup {
--   ensure_installed = { "python" },
--   automatic_setup = true,
-- }

require("nvim-dap-virtual-text").setup {
  commented = true,
}

require("dapui").setup()
dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
-- require("core.utils").load_mappings "dap"
dap.configurations.java = {
  {
    name = "Debug Launch (2GB)",
    javaExec = "java",
    type = "java",
    request = "launch",
    vmArgs = "" .. "-Xmx2g ",
  },
  {
    name = "Debug Attach (8000)",
    type = "java",
    request = "attach",
    hostName = "127.0.0.1",
    port = 8000,
  },
  {
    name = "Debug Attach (5005)",
    type = "java",
    request = "attach",
    hostName = "127.0.0.1",
    port = 5005,
  },
  -- {
  --   name = "My Custom Java Run Configuration",
  --   type = "java",
  --   request = "launch",
  --   -- You need to extend the classPath to list your dependencies.
  --   -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
  --   -- classPaths = {},
  --
  --   -- If using multi-module projects, remove otherwise.
  --   -- projectName = "yourProjectName",
  --
  --   -- javaExec = "java",
  --   mainClass = "replace.with.your.fully.qualified.MainClass",
  --
  --   -- If using the JDK9+ module system, this needs to be extended
  --   -- `nvim-jdtls` would automatically populate this property
  --   -- modulePaths = {},
  --   vmArgs = "" .. "-Xmx2g ",
  -- },
}
