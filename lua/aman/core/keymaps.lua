-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

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
-- nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
-- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
-- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
-- nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>
-- -- vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>j", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>o", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })

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

vim.keymap.set("n", "<leader>k", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })
