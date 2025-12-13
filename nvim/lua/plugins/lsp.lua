return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"j-hui/fidget.nvim",
			tag = "v1.4.0",
			opts = {
				progress = {
					display = { done_icon = "✓" },
				},
				notification = {
					window = { winblend = 0 },
				},
			},
		},
		{
			"yioneko/nvim-vtsls",
			lazy = true,
			ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
			keys = {
				{
					"<leader>co",
					function()
						require("vtsls").commands.organize_imports(0)
					end,
					desc = "Organize Imports",
				},
			},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end

				if client and client.server_capabilities.documentFormattingProvider then
					local filetype = vim.bo[event.buf].filetype
					-- Apply to proto, c/cpp files which are handled by clangd (for c/cpp)
					-- and buf_ls (for proto) which often use clang-format internally.
					if filetype == "proto" or filetype == "c" or filetype == "cpp" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = event.buf,
							callback = function()
								vim.lsp.buf.format({ async = true })
							end,
							desc = "Auto format on save",
						})
					end
				end
			end,
		})

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = { callSnippet = "Replace" },
						telemetry = { enable = false },
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},
			vtsls = {
				settings = {
					complete_function_calls = true,
					vtsls = {
						enableMoveToFileCodeAction = true,
						autoUseWorkspaceTsdk = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = true,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
					},
				},
			},
			gopls = {
				settings = {
					gopls = {
						experimentalPostfixCompletions = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			},
		}

		require("mason").setup()

		local ensure_installed = {
			"delve",
			"intelephense",
			-- "debugpy",
			"tailwindcss-language-server",
			"pyright",
			"stylua",
			"bash-language-server",
			"lua-language-server",
			"goimports",
			"gofumpt",
			"css-lsp",
			"eslint-lsp",
			"gopls",
			"js-debug-adapter",
			"json-lsp",
			"markdown-toc",
			"markdownlint-cli2",
			"marksman",
			"prettier",
			"shellcheck",
			"shfmt",
			"vtsls",
			"buf_ls",
			"buf",
			"clangd",
		}

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

					if server_name == "vtsls" then
						require("vtsls").setup(server)
					else
						require("lspconfig")[server_name].setup(server)
					end
				end,
			},
		})
	end,
}
