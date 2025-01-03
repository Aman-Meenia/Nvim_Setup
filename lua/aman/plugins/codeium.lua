-- return {
-- 	"Exafunction/codeium.nvim",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"hrsh7th/nvim-cmp",
-- 	},
-- 	event = "BufEnter",
-- 	config = function()
-- 		require("codeium").setup({})
-- 		-- 	end,
-- 		-- }
-- 		-- "Exafunction/codeium.nvim",
-- 		-- event = "BufEnter",
-- 		-- config = function()
-- 		-- Change '<C-g>' here to any keycode you like.
-- 		vim.keymap.set("i", "<C-g>", function()
-- 			return vim.fn["codeium#Accept"]()
-- 		end, { expr = true, silent = true })
-- 		vim.keymap.set("i", "<c-;>", function()
-- 			return vim.fn["codeium#CycleCompletions"](1)
-- 		end, { expr = true, silent = true })
-- 		vim.keymap.set("i", "<c-,>", function()
-- 			return vim.fn["codeium#CycleCompletions"](-1)
-- 		end, { expr = true, silent = true })
-- 		vim.keymap.set("i", "<c-x>", function()
-- 			return vim.fn["codeium#Clear"]()
-- 		end, { expr = true, silent = true })
-- 	end,
-- }

return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-;>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<c-]>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })

		-- Disable Codeium for specific file types
		vim.g.codeium_filetypes = {
			["cpp"] = false,
			["c"] = false,
			-- ["javascript"] = false,
			-- ["typescript"] = false,
			-- ["javascriptreact"] = false,
			-- ["typescriptreact"] = false,
			-- ["js"] = false,
			-- ["ts"] = false,
			-- ["jsx"] = false,
			-- ["tsx"] = false,
		}
	end,
}
