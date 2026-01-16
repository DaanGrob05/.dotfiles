require("core")

local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local default_color_scheme = "rose_pine"
local env_var_nvim_theme = os.getenv("NVIM_THEME") or default_color_scheme

local themes = {
	rose_pine = "plugins.themes.rose-pine",
}

require("lazy").setup({
	require(themes[env_var_nvim_theme]),
	require("plugins.lazygit"),
	require("plugins.snacks"),
	require("plugins.noice"),
	require("plugins.blink"),
	require("plugins.lsp"),
	require("plugins.flash"),
	require("plugins.treesitter"),
	require("plugins.autopairs"),
	require("plugins.none-ls"),
	require("plugins.nvim-lint"),
	require("plugins.indent-blankline"),
	require("plugins.conform"),
	require("plugins.gitsigns"),
	require("plugins.nvim-colorizer"),
	require("plugins.todo-comments"),
	require("plugins.inc-rename"),
	require("plugins.lualine"),
	require("plugins.which-key"),
	require("plugins.vim-sleuth"),
	require("plugins.line-mode-indicators"),
	require("plugins.trouble"),
	require("plugins.ts-autotag"),
	require("plugins.rainbow-delimiters"),
	require("plugins.my-dojo"),
	require("plugins.numb"),
	require("plugins.scissors"),
	require("plugins.navigation"),
	require("plugins.mini"),
	require("plugins.nvim-surround"),
	require("plugins.neoscroll"),
	require("plugins.suda"),
	require("plugins.go"),
	require("plugins.undotree"),
}, {
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"netrw",
			},
		},
	},
})

local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	else
		return false
	end
end

local session_file = ".session.vim"

if file_exists(session_file) then
	vim.cmd("source" .. session_file)
end
