return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		local setup = {
			window = {
				border = "rounded", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
		}
		local layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		}
		require("which-key").setup(layout)
		require("which-key").setup(setup)
	end,
	opts = {

		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}

-- return {
-- 	"folke/which-key.nvim",
-- 	event = "VeryLazy",
-- 	init = function()
-- 		vim.o.timeout = true
-- 		vim.o.timeoutlen = 500
--
-- 		local setup = {
-- 			window = {
-- 				border = "rounded", -- none, single, double, shadow
-- 				position = "bottom", -- bottom, top
-- 				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
-- 				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
-- 				winblend = 0,
-- 			},
-- 		}
-- 	end,
-- 	opts = {
-- 		-- your configuration comes here
-- 		-- or leave it empty to use the default settings
-- 		-- refer to the configuration section below
-- 	},
-- }
