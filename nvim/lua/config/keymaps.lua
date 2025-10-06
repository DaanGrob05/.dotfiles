-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot" })
vim.keymap.set("n", "<leader>cen", "<cmd>Copilot enable<cr>", { desc = "Enable Copilot" })
vim.keymap.set("n", "<leader>sar", "<cmd>GrugFar<cr>", { desc = "Open GrugFar" })
vim.keymap.set("n", "<leader>ng", "<cmd>Neogen<cr>", { desc = "Neogen" })
vim.keymap.set("n", "<leader>rn", ":IncRename", { desc = "IncRename" })

vim.keymap.set("n", "<leader>ff", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { noremap = true, silent = true, desc = "Find files (including hidden, no ignore)" })

vim.keymap.set("n", "<leader>fg", function()
  Snacks.picker.grep({ hidden = true, ignored = true })
end, { noremap = true, silent = true, desc = "Grep (including hidden, no ignore)" })

Snacks.toggle.zen():map("<leader>z")

-- Nvim Dap keybinds to mimic Jetbrains debugger

-- local dap = require("dap")
-- local dapui = require("dapui")

-- -- Keybindings for debugging (mimicking PhpStorm)
-- vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" }) -- Start/Continue
-- vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" }) -- Toggle breakpoint
-- vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" }) -- Step over
-- vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" }) -- Step into
-- vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" }) -- Step out

-- -- Breakpoint management
-- vim.keymap.set("n", "<Shift-F9>", function()
--   dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
-- end, { desc = "Debug: Set Conditional Breakpoint" }) -- Conditional breakpoint
--
-- vim.keymap.set("n", "<Ctrl-F9>", function()
--   dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
-- end, { desc = "Debug: Set Logpoint" }) -- Log point
--
-- -- DAP UI
-- vim.keymap.set("n", "<Ctrl-F8>", dapui.toggle, { desc = "Debug: Toggle Debug UI" }) -- Open/Close debug UI
--
-- -- Stopping debugging
-- vim.keymap.set("n", "<Shift-F5>", dap.terminate, { desc = "Debug: Stop" }) -- Stop debugging
--
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "{", "{zz")
-- vim.keymap.set("n", "}", "}zz")
