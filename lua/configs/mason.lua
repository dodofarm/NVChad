require("mason").setup {
  opts = {
    ensure_installed = { "debugpy", "clang-format", "prettier", "stylua" },
  },
}
require("mason-lspconfig").setup {
  ensure_installed = {
    --other LSPs are installed by NVChad
    "pylsp",
  },
}
