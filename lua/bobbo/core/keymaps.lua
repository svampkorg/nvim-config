vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- No Hightlight, clear search highlight

keymap.set("n", "x", '"_x') -- when deleting character with x, do not copy it into clipboard

keymap.set("n", "<leader>+", "<C-a>") -- add 1 to a number
keymap.set("n", "<leader>-", "<C-x>") -- subtract 1 from a number

-- manage split windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- mape split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>sq", ":cclose<CR>") -- close quick fix list
keymap.set("n", "<leader>so", ":only<CR>") -- close all but this window

-- manage tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps
keymap.set("n", "<leader>gg", ":LazyGit<CR>") -- summon LazyGit

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
keymap.set("n", "<leader>fs", "<CMD>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
keymap.set("n", "<leader>fc", "<CMD>Telescope flutter commands<CR>")

-- illuminate
keymap.set("n", "<leader>rf", "<CMD>lua require('illuminate').goto_next_reference(warp)<CR>")
keymap.set("n", "<leader>rb", "<CMD>lua require('illuminate').goto_prev_reference(warp)<CR>")
keymap.set("n", "<leader>rs", "<CMD>lua require('illuminate').textobj_select(warp)<CR>")
