local o = vim.o
local wo = vim.wo
local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.trouble_lualine = true

o.autowrite = true -- Enable auto write
o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
o.completeopt = "menu,menuone,noselect"
o.confirm = true -- Confirm to save changes before exiting modified buffer
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
o.hlsearch = false
wo.number = true
o.mouse = "a"
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.updatetime = 250
o.timeoutlen = 9999
o.backup = false
o.writebackup = false
opt.termguicolors = true
o.whichwrap = "bs<>[]hl"
o.wrap = false
o.linebreak = true
o.scrolloff = 12
o.sidescrolloff = 10
o.relativenumber = false
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.smartindent = true
o.showmode = false
o.showtabline = 0
o.backspace = "indent,eol,start"
o.pumheight = 10
o.conceallevel = 0
o.fileencoding = "utf-8"
o.cmdheight = 1
o.autoindent = true
opt.shortmess:append("c")
opt.iskeyword:append("-")
opt.formatoptions:remove({ "c", "r", "o" })
opt.runtimepath:remove("/usr/share/vim/vimfiles")
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

function foldexpr()
	local buf = vim.api.nvim_get_current_buf()
	if vim.b[buf].ts_folds == nil then
		-- as long as we don't have a filetype, don't bother
		-- checking if treesitter is available (it won't)
		if vim.bo[buf].filetype == "" then
			return "0"
		end
		if vim.bo[buf].filetype:find("dashboard") then
			vim.b[buf].ts_folds = false
		else
			vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
		end
	end
	return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
end
