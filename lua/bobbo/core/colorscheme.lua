-- ensure nightfly was installed, if so, use it
--local status, _ = pcall(vim.cmd, "colorscheme nightfly")
--if not status then
--	print("Colorscheme not found!")
--	return
--end
-- NIGHTFOX CUSTOM
local options = {
	--options
	-- Compiled file's destination location
	compile_path = vim.fn.stdpath("cache") .. "/nightfox",
	compile_file_suffix = "_compiled", -- Compiled file suffix
	transparent = false, -- Disable setting background
	terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	dim_inactive = true, -- Non focused panes set to alternative background
	styles = { -- Style to be applied to different syntax groups
		comments = "italic", -- Value is any valid attr-list value `:help attr-list`
		conditionals = "NONE",
		constants = "NONE",
		functions = "NONE",
		keywords = "NONE",
		numbers = "NONE",
		operators = "NONE",
		strings = "italic",
		types = "NONE",
		variables = "NONE",
	},
	inverse = { -- Inverse highlight for different types
		match_paren = false,
		visual = false,
		search = true,
	},
	modules = { -- List of various plugins and additional options
		-- ...
		lsp_saga = "true",
		native_lsp = "true",
		nvimtree = "true",
		telescope = "true",
		treesitter = "true",
	},
}

local palettes = {
	--palettes
	nightfox = {
		red = "#c94f6d",
	},
	nordfox = {
		--comment = "#8b949e",
		--comment = "#60728a",
		--comment = "2f2f2f",
		-- A palette also defines the following:
		--   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
		--
		-- These are the different foreground and background shades used by the theme.
		-- The base bg and fg is 1, 0 is normally the dark alternative. The others are
		-- incrementally lighter versions.
		--bg1 = "#222222",
		--bg0 = "#151515",
		--bg1 = "#161b22", --git bright
		--bg0 = "#0d1117", --git dark

		bg1 = "#0d1117",
		bg0 = "#0c0c0d",
		-- sel is different types of selection colors.
		--sel0 = "#3e4a5b", -- Popup bg, visual selection bg
		sel0 = "#21262d",
		sel1 = "#30363d",
		--sel0 = "#30363d",
		--sel1 = "#4f6074", -- Popup sel bg, search bg
	},
}

local specs = {
	--specs
	nightfox = {
		syntax = {
			bracket = "white.dim",
			--comment = "",
			keyword = "magenta.bright",
			number = "green.bright",
			operator = "red.bright", -- !?==>> etc
			const = "orange.dim", --override
			field = "blue.bright", --variabl.field[field]field;
			type = "#77CCFF", --classs and widgets
			--variable = "cyan",
			preproc = "yellow.bright", -- imports
			ident = "#888888", --named fields n stuff
			dep = "black",
			conditional = "pink.bright", -- ifs and loops
			builtin0 = "blue.bright", -- variable
			builtin1 = "red.bright", -- type
			builtin2 = "orange.bright", -- const
			func = "blue.bright",
			string = "green.bright",
			--regex = "white",
			--statement = "white",
		},
		git = {
			changed = "#f4a261",
		},
	},
	duskfox = {
		syntax = {
			bracket = "white.dim",
			--comment = "",
			keyword = "magenta.bright",
			number = "green.bright",
			operator = "red.bright", -- !?==>> etc
			const = "orange.dim", --override
			field = "blue.bright", --variabl.field[field]field;
			type = "#77CCFF", --classs and widgets
			--variable = "cyan",
			preproc = "yellow.bright", -- imports
			ident = "#888888", --named fields n stuff
			dep = "black",
			conditional = "pink.bright", -- ifs and loops
			builtin0 = "blue.bright", -- variable
			builtin1 = "red.bright", -- type
			builtin2 = "orange.bright", -- const
			func = "blue.bright",
			string = "green.bright",
			--regex = "white",
			--statement = "white",
		},
		git = {
			changed = "#f4a261",
		},
	},
	--MYCOLORS
	nordfox = {
		syntax = {
			bracket = "#c9d1d9",
			comment = "#666666",
			--comment = "#205D2D",
			--comment = "#007722",
			keyword = "#ff7b72",
			number = "#79c0ff",
			operator = "#ff7b72", -- !?==>> etc
			const = "#ff7b72", --override
			field = "#d2a8ff", --variabl.field[field]field of() getters
			type = "#79c0ff", --classs and widgets
			variable = "#c9d1d9",
			preproc = "#ff7b72", -- imports
			ident = "#c9d1d9", --named fields n stuff
			dep = "black",
			conditional = "#ff7b72", -- ifs and loops
			builtin0 = "#79c0ff", -- variable
			builtin1 = "#ff7b72", -- type
			builtin2 = "#ff7b72", -- const
			func = "#d2a8ff",
			string = "yellow.bright", --"#a5d6ff",
			regex = "yellow",
			statement = "yellow",
		},
		git = {
			changed = "#f4a261",
		},
	},
	all = {
		incsearch = { bg = "palette.cyan" },
		String = { fg = "syntax.string" },
		CursorColumn = { bg = "sel0", link = "" },
	},
}
--local all = {
--	incsearch = { bg = "palette.cyan" },
--	String = { fg = "syntax.string" },
--	CursorColumn = { bg = "sel0", link = "" },
--}
require("nightfox").setup({
	options = options,
	palettes = palettes,
	specs = specs,
	--groups = groups,
})

-- local status_nightfox, _ = pcall(vim.cmd, "colorscheme nordfox")
-- if not status_nightfox then
-- 	print("Colorscheme not found!")
-- 	return
-- end

-- ONEDARK
local setup, onedark = pcall(require, "onedark")
if not setup then
	return
end

onedark.setup({
	-- Main options --
	style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "italic",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

local check, _ = pcall(vim.cmd, "colorscheme onedark")
if not check then
	print("Colorscheme not found!")
	return
end
