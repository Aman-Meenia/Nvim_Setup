return {
	"mbbill/undotree",
	keys = {
		{ "<leader>fu", "<cmd>UndotreeToggle<CR>", desc = "Toggle UndoTree" },
	},
	config = function()
		-- Enable persistent undo if supported
		if vim.fn.has("persistent_undo") == 1 then
			local target_path = vim.fn.expand("~/.undodir")

			-- Create the directory if it doesn't exist
			if not vim.fn.isdirectory(target_path) then
				vim.fn.mkdir(target_path, "p", 0700)
			end

			-- Set undodir and enable undofile
			vim.opt.undodir = target_path
			vim.opt.undofile = true
		end
	end,
}
