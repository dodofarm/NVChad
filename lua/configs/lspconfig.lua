-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- INFO: Currently pyright is only used for completions
-- maybe layer also use it for types? (insted of mypy)
-- https://github.com/astral-sh/ruff-lsp/issues/384p

local servers = { "html", "cssls", "ts_ls", "clangd", "ruff", "tailwindcss", "eslint" }

local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
    python = {
      analysis = {
        ignore = { "*" }, -- Using Ruff
        typeCheckingMode = "off", -- Using mypy
      },
    },
  },
}
