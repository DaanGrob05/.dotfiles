---@diagnostic disable: missing-fields
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			variant = "moon",
			dark_variant = "moon",
			styles = {
				transparency = true,
			},
		})

		vim.cmd("colorscheme rose-pine-moon")
	end,
}
