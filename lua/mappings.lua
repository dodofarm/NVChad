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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
