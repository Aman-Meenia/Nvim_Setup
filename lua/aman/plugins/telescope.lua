return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		-- 🎨 Set custom colors for the search bar
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#91594C", bold = true }) -- Search bar title color
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#91594C" }) -- Border color
		local open_with_trouble = require("trouble.sources.telescope").open

		telescope.setup({
			defaults = {
				mappings = {
					i = { ["<c-t>"] = open_with_trouble },
					n = { ["<c-t>"] = open_with_trouble },
				},
			},
			pickers = {
				find_files = {
					theme = "ivy",
				},
				oldfiles = { theme = "ivy" },
				live_grep = { theme = "ivy" },
				grep_string = { theme = "ivy" },
				current_buffer_fuzzy_find = { theme = "ivy" },
				lsp_document_symbols = { theme = "ivy" },
				buffers = {
					theme = "ivy",
					-- path_display = function(_, path)
					-- 	local utils = require("telescope.utils")
					-- 	local tail = utils.path_tail(path)
					-- 	local dir = utils.transform_path({
					-- 		path_display = { "truncate" },
					-- 	}, path:sub(1, -(#tail + 1)))
					-- 	return dir .. " " .. tail
					-- end,
				},
			},
			extensions = {
				fzf = {},
			},
		})

		telescope.setup({
			defaults = {
				-- path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						-- ["<C-t>"] = open_with_trouble,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>fw",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Fuzzy find in current file" }
		)
		keymap.set("n", "<leader>fh", "<cmd>Telescope lsp_document_symbols<cr>", {
			desc = "Document symbols",
		})
		keymap.set("n", "<leader>fj", function()
			require("telescope.builtin").buffers({
				sort_mru = true,
				sort_lastused = false,
				initial_mode = "normal",
				layout_config = {
					preview_width = 0.45,
				},
			})
		end, { desc = "Find open buffers" })
	end,
}
