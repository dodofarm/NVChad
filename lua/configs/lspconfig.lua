require("nvchad.configs.lspconfig").defaults()
vim.diagnostic.config { virtual_lines = { current_line = true }, virtual_text = { current_line = false } }
vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
  group = vim.api.nvim_create_augroup("diagnostic_virt_text_hide", {}),
  callback = function(ev)
    -- local lnum, _ = unpack(vim.api.nvim_win_get_cursor(0))
    -- lnum = lnum - 1 -- need 0-based index
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local lnum = cursor_pos[1] - 1 -- Convert to 0-based index

    local hidden_lnum = vim.b[ev.buf].diagnostic_hidden_lnum
    if hidden_lnum and hidden_lnum ~= lnum then
      vim.b[ev.buf].diagnostic_hidden_lnum = nil
      -- display all the decorations if the current line changed
      vim.diagnostic.show(nil, ev.buf)
    end

    for _, namespace in pairs(vim.diagnostic.get_namespaces()) do
      local ns_id = namespace.user_data.virt_text_ns
      if ns_id then
        local extmarks = vim.api.nvim_buf_get_extmarks(ev.buf, ns_id, { lnum, 0 }, { lnum, -1 }, {})
        for _, extmark in pairs(extmarks) do
          local id = extmark[1]
          vim.api.nvim_buf_del_extmark(ev.buf, ns_id, id)
        end

        if extmarks and not vim.b[ev.buf].diagnostic_hidden_lnum then
          vim.b[ev.buf].diagnostic_hidden_lnum = lnum
        end
      end
    end
  end,
})
local lspconfig = require "lspconfig"

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
