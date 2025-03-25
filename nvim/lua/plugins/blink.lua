return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      providers = {
        lsp = {
          score_offset = 100,
        },
      },
    })
  end,
}
