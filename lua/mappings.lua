require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "i", "n", "v" }, "<C-c>", "<esc>", { desc = "Make Ctrl+C behave exactly like escape." })
map("i", "jk", "<ESC>")
map("n", "<C-t>", "<cmd> tabnew <CR>", { desc = "Opens a new tab" })
map("n", "<F13>", "<C-i>", { desc = "Support for terminals that can't distinguish between <C-i> and <Tab>" })

-- folding
map("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
map("n", "zK", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek Fold" })

-- neoscroll mappings
local neoscroll = require "neoscroll"

-- stylua: ignore
for _, mode in ipairs { "n", "v", "x" } do
  map(mode, "<C-u>", function() neoscroll.ctrl_u { duration = 50 } end, { desc = "Scroll half page up" })
  map(mode, "<C-d>", function() neoscroll.ctrl_d { duration = 50 } end, { desc = "Scroll half page down" })
  map(mode, "<C-b>", function() neoscroll.ctrl_b { duration = 450 } end, { desc = "Scroll page up" })
  map(mode, "<C-f>", function() neoscroll.ctrl_f { duration = 450 } end, { desc = "Scroll page down" })
  map(mode, "<C-y>", function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end, { desc = "Scroll up small" })
  map(mode, "<C-e>", function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end, { desc = "Scroll down small" })
  map(mode, "zt", function() neoscroll.zt { half_win_duration = 250 } end, { desc = "Scroll cursor to top" })
  map(mode, "zz", function() neoscroll.zz { half_win_duration = 250 } end, { desc = "Scroll cursor to center" })
  map(mode, "zb", function() neoscroll.zb { half_win_duration = 250 } end, { desc = "Scroll cursor to bottom" })
end

-- DAP
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Add breakpoint at line" })
map("n", "<leader>dC", [[:lua require("dap").run_to_cursor() <CR>]], { desc = "Run to Cursor" })
map("n", "<leader>do", "<cmd> DapStepOver <CR>", { desc = "DAP Step over" })
map("n", "<leader>di", "<cmd> DapStepIn <CR>", { desc = "DAP Step in" })
map("n", "<leader>dO", "<cmd> DapStepOut <CR>", { desc = "DAP Out" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "DAP Continue" })
map("n", "<leader>dt", "<cmd> DapTerminate <CR>", { desc = "DAP Terminate" })

-- Leetcode
map("n", "<leader>lm", "<cmd>Leet<CR>", { desc = "Open LeetCode/Menu" })
map("n", "<leader>lc", "<cmd>Leet console<CR>", { desc = "Open Console" })
map("n", "<leader>li", "<cmd>Leet info<CR>", { desc = "Question Info" })
map("n", "<leader>lg", "<cmd>Leet lang<CR>", { desc = "Change Language" })
map("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "Run Question" })
map("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "Submit Question" })
map("n", "<leader>ll", "<cmd>Leet list<CR>", { desc = "Open Problem List" })
map("n", "<leader>lo", "<cmd>Leet open<CR>", { desc = "Open in Browser" })
map("n", "<leader>lx", "<cmd>Leet reset<CR>", { desc = "Reset Question" })
map("n", "<leader>la", "<cmd>Leet last_submit<CR>", { desc = "Retrieve Last Submission" })
map("n", "<leader>lj", "<cmd>Leet inject<CR>", { desc = "Re-inject Code" })
map("n", "<leader>ld", "<cmd>Leet desc toggle<CR>", { desc = "Toggle Description" })

map("n", "<leader>y", [[:lua YankDiagnosticError() <CR>]], { noremap = true, silent = true, desc = "Copy LSP error" })

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
