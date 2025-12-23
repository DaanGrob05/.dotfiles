local function get_project_root()
	local path = vim.fn.expand("%:p:h")
	local root_patterns = { ".git", "lua", "src", "Makefile", "package.json" }

	for _, pattern in ipairs(root_patterns) do
		local root = vim.fs.find(pattern, { upward = true, path = path })[1]
		if root then
			return vim.fs.dirname(root)
		end
	end

	return vim.fn.getcwd()
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Comments
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

vim.keymap.set({ "n", "v" }, "<Space>", "<nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>qq", "<Cmd>qa<CR>", { silent = true })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Window Management
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

vim.keymap.set("n", "<leader>cr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename", expr = true })

vim.keymap.set("n", "<leader>co", function()
	vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
end, { desc = "LSP: Organize Imports", buffer = 0 })

vim.keymap.set("n", "<leader>pr", ":!prc ", { desc = "Pull Request Checkout" })

-- Suda
vim.keymap.set("n", "<leader>ws", ":SudaWrite", { desc = "Suda Write" })
vim.keymap.set("n", "<leader>rs", ":SudaRead", { desc = "Suda Read" })

vim.keymap.set("x", "v", "V")

vim.keymap.set("n", "<leader>ie", "oif err != nil {<CR>}<Esc>O")
