return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			lua = { "stylua" },
			sql = { "pg_format" },
		},

		formatters = {
			pg_format = {
				command = "pg_format",
				args = {
					"--spaces",
					"2",
					"--wrap-limit",
					"0",
					"--keyword-case",
					"2",
				},
				stdin = true,
			},
		},
		format_after_save = function(bufnr)
			local disable = vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat
			if disable then
				return
			end
			return {
				lsp_fallback = false,
				async = true,
			}
		end,
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}
