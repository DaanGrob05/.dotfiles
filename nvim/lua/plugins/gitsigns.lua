return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function()
			vim.api.nvim_set_hl(0, "GitSignsAdd", {
				fg = "#9ece6a", -- soft green
				bg = "#1a1b26", -- dark background
				bold = true,
			})
			vim.api.nvim_set_hl(0, "GitSignsChange", {
				fg = "#7aa2f7", -- bright blue
				bg = "#1a1b26",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "GitSignsDelete", {
				fg = "#f7768e", -- soft red
				bg = "#1a1b26",
				bold = true,
			})
		end,
	},
}
