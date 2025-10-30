return {
	"chrisgrieser/nvim-scissors",
	opts = {
		snippetDir = vim.fn.stdpath("config") .. "/snippets",
	},
	keys = {
		{
			"<leader>se",
			function()
				require("scissors").editSnippet()
			end,
			desc = "Snippet Edit",
		},
		{
			"<leader>sa",
			function()
				require("scissors").addNewSnippet()
			end,
			desc = "Snippet: Add",
			mode = { "n", "x" },
		},
	},
}
