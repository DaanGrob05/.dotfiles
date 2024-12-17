-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Enable Zen Mode on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("OpenSnacksZen", { clear = true }),
  callback = function()
    vim.defer_fn(function()
      -- Close Neo-tree if it's open
      if package.loaded["neo-tree"] then
        vim.cmd("Neotree close")
      end

      -- Trigger zen mode
      require("snacks").zen()
    end, 125) -- Delay to ensure all plugins are loaded
  end,
})
