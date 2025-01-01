-- Function to get current timestamp in IST
local function get_timestamp()
	local current_time = os.time()
	return os.date("Created: %a %b %d %H:%M:%S IST %Y", current_time)
end

-- Template directory path
local template_dir = vim.fn.expand("~/.config/nvim/templates/")

-- Function to get all template files
local function get_template_files()
	local templates = {}
	local handle = vim.loop.fs_scandir(template_dir)
	if handle then
		while true do
			local name, type = vim.loop.fs_scandir_next(handle)
			if not name then
				break
			end
			if type == "file" and name:match("%.cpp$") then
				local template_name = name:gsub("%.cpp$", "")
				templates[template_name] = template_dir .. name
			end
		end
	end
	return templates
end

-- Function to get template content with updated timestamp
local function get_template_content(template_name)
	local templates = get_template_files()
	local template_path = templates[template_name]

	if not template_path then
		print("Error: Template " .. template_name .. " not found!")
		return nil
	end

	local file = io.open(template_path, "r")
	if not file then
		print("Error: " .. template_path .. " not found!")
		return nil
	end

	local content = file:read("*all")
	file:close()

	-- Only update timestamp for template.cpp
	if template_name == "template" then
		content = content:gsub("Created:.-\n", get_timestamp() .. "\n")
	end
	return content
end

-- Function to insert template content into the current buffer
local function insert_template(template_name)
	local content = get_template_content(template_name)
	if content then
		local lines = vim.split(content, "\n")
		local row = vim.api.nvim_win_get_cursor(0)[1] - 1
		vim.api.nvim_buf_set_lines(0, row, row, false, lines)
	end
end

-- Create commands for each template
local function create_template_commands()
	local templates = get_template_files()
	for template_name, _ in pairs(templates) do
		local command_name = template_name:sub(1, 1):upper() .. template_name:sub(2) .. "Template"
		vim.api.nvim_create_user_command(command_name, function()
			insert_template(template_name)
		end, {})
	end
end

-- Auto-insert the default template for new C++ files
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.cpp",
	callback = function()
		local content = get_template_content("template")
		if content then
			vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(content, "\n"))
		else
			print("Unable to auto-insert template. Ensure template.cpp exists.")
		end
	end,
})

-- nvim-cmp custom source setup
local has_cmp, cmp = pcall(require, "cmp")
if has_cmp then
	local source = {}
	source.new = function()
		return setmetatable({}, { __index = source })
	end

	function source:is_available()
		return vim.bo.filetype == "cpp"
	end

	function source:get_debug_name()
		return "cpp_template"
	end

	function source:complete(params, callback)
		local templates = get_template_files()
		local items = {}

		for template_name, template_path in pairs(templates) do
			local content = get_template_content(template_name)
			if content then
				table.insert(items, {
					label = template_name,
					filterText = template_name,
					kind = vim.lsp.protocol.CompletionItemKind.Snippet,
					documentation = {
						kind = "markdown",
						value = "Insert " .. template_name .. " template\n```cpp\n" .. content .. "\n```",
					},
					insertText = content,
				})
			end
		end
		callback({ items = items })
	end

	-- Register the source
	cmp.register_source("cpp_template", source.new())

	-- Add the source to the cmp configuration for C++ files
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "cpp",
		callback = function()
			cmp.setup.buffer({
				sources = {
					{ name = "nvim_lsp", priority = 1000 }, -- LSP source with high priority
					{ name = "cpp_template", priority = 100 }, -- Template source with lower priority
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	})
end

-- Create keymaps for all templates
local function create_template_keymaps()
	local templates = get_template_files()
	for template_name, _ in pairs(templates) do
		vim.keymap.set("n", "<leader>t" .. template_name:sub(1, 1), function()
			insert_template(template_name)
		end, { desc = "Insert " .. template_name .. " template" })
	end
end

-- Initialize commands and keymaps
create_template_commands()
create_template_keymaps()

-- Debug command to list all available templates
vim.api.nvim_create_user_command("ListTemplates", function()
	local templates = get_template_files()
	print("Available templates:")
	for name, path in pairs(templates) do
		print(string.format("%s: %s", name, path))
	end
end, {})
