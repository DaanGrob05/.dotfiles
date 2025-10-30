return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "InsertLeave" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			ts = { "eslint" },
			go = { "golangcilint" },
			lua = { "luac" },
			proto = { "buf_ls" },
		}

		vim.diagnostic.config({ virtual_text = true })
	end,
}
