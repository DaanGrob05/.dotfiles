-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>", { desc = "Disable Copilot" })
vim.keymap.set("n", "<leader>cen", "<cmd>Copilot enable<cr>", { desc = "Enable Copilot" })
vim.keymap.set("n", "<leader>sar", "<cmd>GrugFar<cr>", { desc = "Open GrugFar" })
vim.keymap.set("n", "<leader>ng", "<cmd>Neogen<cr>", { desc = "Neogen" })
vim.keymap.set("n", "<leader>rn", ":IncRename", { desc = "IncRename" })

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files({
    hidden = true, -- Enable hidden files
    no_ignore = true, -- Disable .gitignore and other ignore files
    no_ignore_parent = true, -- Disable ignoring in parent directories
    file_ignore_patterns = { "node_modules/", "dist/", "git/" },
  })
end, { noremap = true, silent = true, desc = "Find files (including hidden, no ignore)" })
