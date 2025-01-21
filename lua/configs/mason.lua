require("mason").setup {
  opts = {
    ensure_installed = { "debugpy", "clang-format", "prettier", "stylua" },
  },
}
