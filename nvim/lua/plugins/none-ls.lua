return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier",
      },
      automatic_installation = true,
    })

    local sources = {
      formatting.prettier.with({
        prefer_local = "node_modules/.bin",
        filetypes = { "html", "json", "yaml", "markdown", "javascript", "typescript" },
      }),

      formatting.stylua,
    }

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = [[%s/\s\+$//e]],
    })

    null_ls.setup({
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   group = augroup,
          --   buffer = bufnr,
          --   callback = function()
          --     vim.lsp.buf.format({ async = false })
          --   end,
          -- })
        end
      end,
    })
  end,
}
