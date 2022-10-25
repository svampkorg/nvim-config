local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change hightlight group (color) for arrows by folder
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local nt_api = require("nvim-tree.api")
--local function set_root_to_node()
--  nt_api.tree.change_root_to_node
--end

nvimtree.setup({
	create_in_closed_folder = true,
	sync_root_with_cwd = false,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				-- custom action
				{
					key = ",",
					action = "set_root_to_node",
					action_cb = function()
						nt_api.tree.change_root_to_node()
					end,
				},
			},
		},
		float = {
			enable = true,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 30,
				height = 60,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		icons = {
			glyphs = {
				folder = {
					-- arrow_closed = "→", -- arrow when folder is closed
					--arrow_open = "↪", -- arrow when folder is open
					-- arrow_open = "↓", -- arrow when folder is open
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
})
