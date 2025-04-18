return {
	"crnvl96/lazydocker.nvim",
	cmd = { "LazyDocker" }, -- Load only when this command is run
	opts = {}, -- automatically calls `require("lazydocker").setup()`
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
