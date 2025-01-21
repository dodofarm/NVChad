local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    -- python = { "ruff" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  -- log_level = vim.log.levels.DEBUG,
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
