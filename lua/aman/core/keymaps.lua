-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- use leader + o to enter visual mode
vim.keymap.set("n", "<leader>o", "v", { noremap = true, silent = true, desc = "Enter visual mode" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- Keymap to move up and down in insert mode
vim.keymap.set("i", "<C-h>", "<left>", { desc = "Move left in insert mode" })
vim.keymap.set("i", "<C-l>", "<right>", { desc = "Move right in insert mode" })
vim.keymap.set("i", "<C-j>", "<down>", { desc = "Move down in insert mode" })
vim.keymap.set("i", "<C-k>", "<up>", { desc = "Move up in insert mode" })

-- Map arrow keys to their respective movements in insert mode
vim.keymap.set("i", "<left>", "<left>", { desc = "Move left in insert mode" })
vim.keymap.set("i", "<down>", "<down>", { desc = "Move down in insert mode" })
vim.keymap.set("i", "<up>", "<up>", { desc = "Move up in insert mode" })
vim.keymap.set("i", "<right>", "<right>", { desc = "Move right in insert mode" })

-- // Preview setting
vim.keymap.set("n", "<leader>g", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>o", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })

-- vim.keymap.set(
-- 	"n",
-- 	"<leader>o",
-- 	"<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
-- 	{ noremap = true }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>o",
-- 	"<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
-- 	{ noremap = true }
-- )
-- vim.keymap.set("n", "<leader>o", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { noremap = true })

-- LazyDocker setup

vim.keymap.set("n", "<leader>lg", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })

local function compile_cpp(file_path, file_dir, file_name)
	local compile_command = string.format('g++ -std=c++20 -o "%s/%s" "%s"', file_dir, file_name, file_path)
	local compile_output = vim.fn.system(compile_command)
	if vim.v.shell_error ~= 0 then
		-- Create a new split window for error output
		vim.cmd("botright split")
		vim.cmd("enew")
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(compile_output, "\n"))
		vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
		vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
		vim.api.nvim_buf_set_name(buf, "Compilation Error")
		vim.cmd("normal! G")
		print("Compilation failed. See error message in the split window.")
		return false
	end
	return true
end

local function run_cpp_with_io(file_dir, file_name)
	local input_file = file_dir .. "/input.txt"
	local output_file = file_dir .. "/output.txt"

	-- Check if input.txt exists
	if vim.fn.filereadable(input_file) == 0 then
		print("input.txt not found. Creating an empty file.")
		vim.fn.system(string.format('touch "%s"', input_file))
	end

	-- Run the compiled program
	local run_command = string.format('cd "%s" && ./%s < input.txt > output.txt 2>&1', file_dir, file_name)
	vim.fn.system(run_command)

	-- Check if output.txt buffer is already open
	local output_buf = nil
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_name(buf):match("output.txt$") then
			output_buf = buf
			break
		end
	end

	if output_buf then
		-- If output buffer exists, switch to its window
		local win_id = vim.fn.bufwinid(output_buf)
		if win_id ~= -1 then
			vim.api.nvim_set_current_win(win_id)
		else
			-- If buffer exists but not in any window, open it in a vsplit
			vim.cmd("vsplit")
			vim.api.nvim_win_set_buf(0, output_buf)
		end
	else
		-- If output buffer doesn't exist, create a new one
		vim.cmd("vsplit " .. output_file)
		output_buf = vim.api.nvim_get_current_buf()
	end

	-- Reload the content of the output buffer
	vim.api.nvim_buf_set_option(output_buf, "buftype", "")
	vim.cmd("edit!")
	print("Program executed. Output saved to output.txt and displayed in split window.")
end

local function compile_and_run_cpp()
	vim.cmd("write") -- Save the current file
	local file_path = vim.fn.expand("%:p")
	local file_dir = vim.fn.expand("%:p:h")
	local file_name = vim.fn.expand("%:t:r")

	if compile_cpp(file_path, file_dir, file_name) then
		run_cpp_with_io(file_dir, file_name)
	end
end

-- Map the key to the function
vim.keymap.set(
	"n",
	"<Space>b",
	compile_and_run_cpp,
	{ desc = "Compile and Run C++ with input from input.txt and output to output.txt", noremap = true }
)
