return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig", -- Add this dependency if not already included
	},
	config = function()
		-- import mason
		local mason = require("mason")
		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- import lspconfig
		local lspconfig = require("lspconfig")

		-- Define lsp_on_attach function if not already defined
		local lsp_on_attach = function(client, bufnr)
			-- Your on_attach logic here
			-- For example:
			-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})
			-- Add any other attach-time configurations
		end

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				-- "clangd",
			},
		})

		-- TO NOT SHOW ANY WARNING MESSAGE FOR CLANGD
		-- lspconfig.clangd.setup({
		-- 	on_attach = lsp_on_attach,
		-- 	cmd = {
		-- 		"clangd",
		-- 		-- "--std=c++20",
		-- 		"--log=error",
		-- 		"--header-insertion=never",
		-- 		"--completion-style=detailed",
		-- 	},
		-- 	handlers = {
		-- 		["textDocument/publishDiagnostics"] = function() end, -- Disable diagnostics
		-- 	},
		-- 	capabilities = {
		-- 		textDocument = {
		-- 			completion = {
		-- 				completionItem = {
		-- 					snippetSupport = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- require("lspconfig").clangd.setup({
		-- 	on_attach = lsp_on_attach,
		-- 	cmd = {
		-- 		"clangd",
		-- 		"--background-index",
		-- 		"--completion-style=detailed",
		-- 		"--header-insertion=never",
		-- 		"--enable-config",
		-- 	},
		-- 	init_options = {
		-- 		fallbackFlags = { "-std=c++20" }, -- This is the correct way to set C++20
		-- 	},
		-- 	capabilities = {
		-- 		textDocument = {
		-- 			completion = {
		-- 				completionItem = {
		-- 					snippetSupport = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
		--
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"clang-format",
				"eslint_d",
			},
		})
	end,
}

-- return {
-- 	"williamboman/mason.nvim",
-- 	dependencies = {
-- 		"williamboman/mason-lspconfig.nvim",
-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
-- 	},
-- 	config = function()
-- 		-- import mason
-- 		local mason = require("mason")
--
-- 		-- import mason-lspconfig
-- 		local mason_lspconfig = require("mason-lspconfig")
--
-- 		local mason_tool_installer = require("mason-tool-installer")
--
-- 		-- enable mason and configure icons
-- 		mason.setup({
-- 			ui = {
-- 				icons = {
-- 					package_installed = "✓",
-- 					package_pending = "➜",
-- 					package_uninstalled = "✗",
-- 				},
-- 			},
-- 		})
--
-- 		mason_lspconfig.setup({
-- 			-- list of servers for mason to install
-- 			ensure_installed = {
-- 				-- "tsserver",
-- 				"ts_ls",
-- 				"html",
-- 				"cssls",
-- 				"tailwindcss",
-- 				"svelte",
-- 				"lua_ls",
-- 				"graphql",
-- 				"emmet_ls",
-- 				"prismals",
-- 				"pyright",
-- 				"clangd",
-- 				-- "rust_analyzer",
-- 				-- "jsonls",
-- 				-- "yamlls",
-- 			},
-- 		})
--
--
-- 		mason_tool_installer.setup({
-- 			ensure_installed = {
-- 				"prettier", -- prettier formatter
-- 				"stylua", -- lua formatter
-- 				"isort", -- python formatter
-- 				"black", -- python formatter
-- 				"pylint",
-- 				"clang-format",
-- 				-- "eslint",
-- 				"eslint_d",
-- 			},
-- 		})
-- 	end,
-- }
