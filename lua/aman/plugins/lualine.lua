return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			blue = "#65d1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#2E2C47",
			inactive_bg = "#2c3043",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.fg },
				c = { bg = colors.inactive_bg, fg = colors.fg },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
			},
			sections = {
				lualine_a = {
					{
						-- "mode",
						-- function()
						-- 	local filename = vim.fn.expand("%:t") -- Get just the filename
						-- 	local first_letter = filename:sub(1, 1):upper() -- Get first letter and capitalize it
						-- 	local rest_of_name = filename:sub(2) -- Get rest of the filename
						-- 	if filename == "" then
						-- 		return "" -- Return just icon if no file is open
						-- 	else
						-- 		return "" .. " " .. first_letter .. rest_of_name -- Return icon + space + capitalized filename
						-- 	end
						-- end,
						-- 		icon = "",

						function()
							return "" -- Only the icon
						end,

						color = function()
							local mode_color = {
								n = "#5B7AB9", -- Normal mode
								i = "#89B4FA", -- Insert mode
								v = "#FEC2E7", -- Visual mode
								V = "#FEC2E7", -- Visual Line mode
								[""] = "#FEC2E7", -- Visual Block mode
								c = "#FAB387", -- Command mode
							}
							return { bg = mode_color[vim.fn.mode()] or "#5B7AB9", fg = "#101322" }
						end,

						-- section_separators = { left = "", right = "" },
						separator = { left = "", right = "" },
						-- color = function()
						-- 	local mode_color = {
						-- 		n = "#5B7AB9", -- Normal mode
						-- 		i = "#89B4FA", -- Insert mode
						-- 		v = "#FEC2E7", -- Visual mode
						-- 		V = "#FEC2E7", -- Visual Line mode
						-- 		[""] = "#FEC2E7", -- Visual Block mode
						-- 		c = "#FAB387", -- Command mode
						-- 	}
						-- 	return { bg = "#5B7AB9", fg = "#101322" }
						-- end,
					},
				},
				lualine_b = {
					{
						"filename",
						-- icon = "",
						separator = { left = "", right = "" },
						color = {
							fg = "#1c1d21",
							bg = "#7d83ac",
						},
					},
					-- {
					-- 	"diff",
					-- 	separator = { left = "", right = "" },
					-- 	color = {
					-- 		fg = "#1c1d21",
					-- 		bg = "#7d83ac",
					-- 	},
					-- },
				},
				lualine_c = {
					{
						"diagnostics",
						separator = { left = "", right = "" },
						color = {
							bg = "#45475a",
						},
					},
				},
				lualine_x = {},
				-- lualine_y = {
				-- 	{
				-- 		"filetype",
				-- 		icons_enabled = true,
				-- 		color = {
				-- 			fg = "#1C1D21",
				-- 			bg = "#eba0ac",
				-- 		},
				-- 	},
				-- },
				lualine_y = {},
				lualine_z = {
					{
						"branch",
						icon = "",
						color = function()
							local mode_color = {
								n = "#5B7AB9", -- Normal mode
								i = "#89B4FA", -- Insert mode
								v = "#FEC2E7", -- Visual mode
								V = "#FEC2E7", -- Visual Line mode
								[""] = "#FEC2E7", -- Visual Block mode
								c = "#FAB387", -- Command mode
							}
							return { bg = mode_color[vim.fn.mode()] or "#5B7AB9", fg = "#101322" }
						end,
					},
				},
			},
		})
	end,
}
-- -- return {}
-- -- return {
-- -- 	"nvim-lualine/lualine.nvim",
-- -- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- -- 	priority = 1000,
-- -- 	config = function()
-- -- 		local lualine = require("lualine")
-- -- 		-- local lazy_status = require("lazy.status") -- to configure lazy pending updates count
-- --
-- -- 		local colors = {
-- -- 			blue = "#65d1FF",
-- -- 			green = "#3EFFDC",
-- -- 			violet = "#FF61EF",
-- -- 			yellow = "#FFDA7B",
-- -- 			red = "#FF4A4A",
-- -- 			fg = "#c3ccdc",
-- -- 			bg = "#2c3043",
-- -- 			inactive_bg = "#2c3043",
-- -- 		}
-- --
-- -- 		local my_lualine_theme = {
-- -- 			normal = {
-- -- 				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
-- -- 				b = { bg = colors.bg, fg = colors.fg },
-- -- 				c = { bg = colors.bg, fg = colors.fg },
-- -- 			},
-- -- 			insert = {
-- -- 				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
-- -- 				b = { bg = colors.bg, fg = colors.fg },
-- -- 				c = { bg = colors.bg, fg = colors.fg },
-- -- 			},
-- -- 			visual = {
-- -- 				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
-- -- 				b = { bg = colors.bg, fg = colors.fg },
-- -- 				c = { bg = colors.bg, fg = colors.fg },
-- -- 			},
-- -- 			command = {
-- -- 				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
-- -- 				b = { bg = colors.bg, fg = colors.fg },
-- -- 				c = { bg = colors.bg, fg = colors.fg },
-- -- 			},
-- -- 			replace = {
-- -- 				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
-- -- 				b = { bg = colors.bg, fg = colors.fg },
-- -- 				c = { bg = colors.bg, fg = colors.fg },
-- -- 			},
-- -- 			inactive = {
-- -- 				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
-- -- 				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
-- -- 				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
-- -- 			},
-- -- 		}
-- --
-- -- 		-- configure lualine with modified theme
-- -- 		lualine.setup({
-- -- 			options = {
-- -- 				theme = my_lualine_theme,
-- -- 			},
-- -- 			sections = {
-- -- 				lualine_a = {
-- -- 					{
-- -- 						-- "mode",
-- -- 						-- function()
-- -- 						-- 	local filename = vim.fn.expand("%:t") -- Get just the filename
-- -- 						-- 	local first_letter = filename:sub(1, 1):upper() -- Get first letter and capitalize it
-- -- 						-- 	local rest_of_name = filename:sub(2) -- Get rest of the filename
-- -- 						-- 	if filename == "" then
-- -- 						-- 		return "" -- Return just icon if no file is open
-- -- 						-- 	else
-- -- 						-- 		return "" .. " " .. first_letter .. rest_of_name -- Return icon + space + capitalized filename
-- -- 						-- 	end
-- -- 						-- end,
-- -- 						-- 		icon = "",
-- --
-- -- 						function()
-- -- 							return "" -- Only the icon
-- -- 						end,
-- --
-- -- 						-- 				section_separators = { left = "", right = "" },
-- -- 						separator = { left = "", right = "" },
-- -- 						color = function()
-- -- 							local mode_color = {
-- -- 								n = "#5B7AB9", -- Normal mode
-- -- 								i = "#89B4FA", -- Insert mode
-- -- 								v = "#FEC2E7", -- Visual mode
-- -- 								V = "#FEC2E7", -- Visual Line mode
-- -- 								[""] = "#FEC2E7", -- Visual Block mode
-- -- 								c = "#FAB387", -- Command mode
-- -- 							}
-- -- 							return { bg = mode_color[vim.fn.mode()] or "#5B7AB9", fg = "#101322" }
-- -- 						end,
-- -- 					},
-- -- 				},
-- --
-- -- 				lualine_b = {
-- -- 					{
-- -- 						"filename",
-- -- 						-- icon = "",
-- -- 						separator = { left = "", right = "" },
-- -- 						color = {
-- -- 							fg = "#1c1d21",
-- -- 							bg = "#7d83ac",
-- -- 						},
-- -- 					},
-- -- 					-- {
-- -- 					-- 	"diff",
-- -- 					-- 	separator = { left = "", right = "" },
-- -- 					-- 	color = {
-- -- 					-- 		fg = "#1c1d21",
-- -- 					-- 		bg = "#7d83ac",
-- -- 					-- 	},
-- -- 					-- },
-- -- 				},
-- -- 				lualine_c = {
-- -- 					{
-- -- 						"diagnostics",
-- -- 						separator = { left = "", right = "" },
-- -- 						color = {
-- -- 							bg = "#45475a",
-- -- 						},
-- -- 					},
-- -- 				},
-- -- 				lualine_x = {},
-- -- 				lualine_y = {
-- -- 					{
-- -- 						"filetype",
-- -- 						icons_enabled = true,
-- -- 						color = {
-- -- 							fg = "#1C1D21",
-- -- 							bg = "#eba0ac",
-- -- 						},
-- -- 					},
-- -- 				},
-- -- 				-- lualine_x = {
-- -- 				-- 	{
-- -- 				-- 		lazy_status.updates,
-- -- 				-- 		cond = lazy_status.has_updates,
-- -- 				-- 		color = { fg = "#ff9e64" },
-- -- 				-- 	},
-- -- 				-- 	{ "encoding" },
-- -- 				-- 	{ "fileformat" },
-- -- 				-- 	{ "filetype" },
-- -- 				-- },
-- -- 				-- lualine_z = { "filename" },
-- -- 				-- lualine_z = {
-- -- 				-- 	{
-- -- 				-- 		"branch",
-- -- 				-- 		icon = "",
-- -- 				-- 		color = function()
-- -- 				-- 			local mode_color = {
-- -- 				-- 				n = "#5B7AB9", -- Normal mode
-- -- 				-- 				i = "#89B4FA", -- Insert mode
-- -- 				-- 				v = "#FEC2E7", -- Visual mode
-- -- 				-- 				V = "#FEC2E7", -- Visual Line mode
-- -- 				-- 				[""] = "#FEC2E7", -- Visual Block mode
-- -- 				-- 				c = "#FAB387", -- Command mode
-- -- 				-- 			}
-- -- 				-- 			return { bg = mode_color[vim.fn.mode()] or "#5B7AB9", fg = "#101322" }
-- -- 				-- 		end,
-- -- 				-- 	},
-- -- 				-- },
-- -- 			},
-- -- 		})
-- -- 	end,
-- -- }
