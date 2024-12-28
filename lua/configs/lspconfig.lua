-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "clangd", "jdtls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    pylsp = {
      plugins = {
        -- Disable other linters/formatters as ruff will handle them
        pycodestyle = { enabled = false },
        flake8 = { enabled = false },
        pylint = { enabled = false },
        mccabe = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pyflakes = { enabled = false },
        mypy = {
          enabled = true,
          live_mode = true,
        },
        ruff = {
          enabled = true,
        },
        rope_autoimport = { enabled = true },
        rope = { enabled = true },
      },
    },
  },
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
