require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- DAP
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Add breakpoint at line" })
map("n", "<leader>dso", "<cmd> DapStepOver <CR>", { desc = "DAP Step over" })
map("n", "<leader>dsi", "<cmd> DapStepIn <CR>", { desc = "DAP Step in" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "DAP Continue" })
map("n", "<leader>dt", "<cmd> DapTerminate <CR>", { desc = "DAP Terminate" })

map("n", "<leader>y", [[:lua YankDiagnosticError()<CR>]], { noremap = true, silent = true, desc = "Copy error" })

function YankDiagnosticError()
  vim.diagnostic.open_float()
  vim.diagnostic.open_float()
  local win_id = vim.fn.win_getid() -- get the window ID of the floating window
  vim.cmd "normal! j" -- move down one row
  vim.cmd "normal! VG" -- select everything from that row down
  vim.cmd "normal! y" -- yank selected text
  vim.api.nvim_win_close(win_id, true) -- close the floating window by its ID
end
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
