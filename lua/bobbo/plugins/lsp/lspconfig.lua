local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
	return
end

local status, flutter_tools = pcall(require, "flutter-tools")
if not status then
	return
end

-- local sourcekit_status, sourcekit = pcall(require, "sourcekit")
-- if not sourcekit_status then
-- 	return
-- end

-- local kotlin_status, kotlin_language_server = pcall(require, "kotlin-language-server")
-- if not kotlin_status then
-- 	return
-- end

--local keymap = vim.keymap

-- enable keybinds for available lsp server
--local on_attach = function(client, bufnr)
local on_attach = function(client, bufnr)
	--local opts = { noremap = true, silent = true, buffer = bufnr }
	--local map = vim.api.nvim_buf_set_keymap

	--local keymap = vim.keymap
	local map = vim.api.nvim_buf_set_keymap
	--local opt = vim.api.nvim_buf_set_option
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
	--vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, opts)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	--vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	--vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	--vim.keymap.set('n', '<leader>wl', function()
	--  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- LSPCONFIG
	--opt(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	--map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	--map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	--map(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	--map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	--map(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	-- LSP SAGA
	--map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
	--map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	--map(bufnr, "x", "<leader>ca", ":<c-u>Lspsaga range_code_action<cr>", opts)
	----	map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	----map(bufnr, "n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	--map(bufnr, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	--map(bufnr, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	--map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
	--map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
	--map(bufnr, "n", "<C-c>", "<cmd>close<CR>", opts)
	--map(0, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
	--map(0, "x", "<leader>ca", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })

	--- In lsp attach function
	-- set keybinds
	--keymap.set("n", "gf", "<CMD>Lspsaga lsp_finder<CR>", opts)
	--keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
	--keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", opts)
	--keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
	if client.name == "dartls" then
		-- keymaps for dartls
		map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
		map(bufnr, "x", "<leader>ca", ":<c-u>Lspsaga range_code_action<cr>", opts)
		map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
	--map(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	--map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
	--map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
	else
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		--vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	end

	if client.name == "tsserver" then
		vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		vim.keymap.set("n", "<leader>oi", ":TypeScriptOrganizeImports<CR>") -- organize imports
		vim.keymap.set("n", "<leader>ru", ":TypeScriptRemoveUnused<CR>") -- remove unused variables
	end
end

-- used to enable autocompletion (assign to every lsp config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- change to lspconfig["kotlin-language-server"].setup
lspconfig["kotlin_language_server"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["sourcekit"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "xcrun", "sourcekit-lsp", "--log-level", "error" },
	filetypes = { "swift", "objective-c", "objective-cpp" },
})
-- lspconfig["kotlin"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })
-- --
--lspconfig["ktlint"].setup({
--	capabilities = capabilities,
--	on_attach = on_attach,
--})

--lspconfig["dartls"].setup({
--	capabilities = capabilities,
--	on_attach = on_attach,
--})

--lspconfig['dart'].setup({
--  capabilities = capabilities,
--  on_attach = on_attach
--})

--lspconfig['flutter'].setup({
--  capabilities = capabilities,
--  on_attach = on_attach
--})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			-- make the language server recongnize 'vim' global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- kotlin_language_server.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- flutter
flutter_tools.setup({
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
		-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
		-- please note that this option is eventually going to be deprecated and users will need to
		-- depend on plugins like `nvim-notify` instead.
		notification_style = "plugin",
		-- notification_style = 'native' | 'plugin'
	},
	decorations = {
		statusline = {
			-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
			-- this will show the current version of the flutter app from the pubspec.yaml file
			app_version = true,
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
			-- this will show the currently running device if an application was started with a specific
			-- device
			device = true,
		},
	},
	--debugger = { -- integrate with nvim dap + install dart code debugger
	--  enabled = false,
	--  run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
	--   register_configurations = function(paths)
	--     require("dap").adapters.dart = {
	--			type = "executable",
	--			command = "flutter",
	--			-- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
	--			args = {"debug_adapter"}
	--			--args = {os.getenv('HOME').."/Libraries/Dart-Code/out/dist/debug.js", "flutter"}
	--			--args = {"/home/bobbo/Libraries/Dart-Code/out/dist/debug.js", "flutter"}
	--		 }
	--     require("dap").configurations.dart = {
	--			{
	--				type = "dart",
	--				request = "launch",
	--				name = "Launch Flutter Program",
	--				dartSdkPath = os.getenv('HOME').."/Libraries/flutter/bin/cache/dart-sdk/",
	--				flutterSdkPath = os.getenv('HOME').."/Libraries/flutter",
	--				-- The nvim-dap plugin populates this variable with the filename of the current buffer
	--				program = "${workspaceFolder}/lib/main.dart",
	--				-- The nvim-dap plugin populates this variable with the editor's current working directory
	--				cwd = "${workspaceFolder}"
	--			}
	--     }
	--   end
	--},

	-- debugger = { -- integrate with nvim dap + install dart code debugger
	--   enabled = false,
	--   run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
	--   register_configurations = function(paths)
	--     requir.configurations.dart = {
	--       <put here config that you would find in .vscode/launch.json>
	--     }
	--   end,
	-- },
	-- flutter_path = "/home/bobbo/Libraries/flutter/bin/flutter", -- <-- this takes priority over the lookup
	-- flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
	-- fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
	widget_guides = {
		enabled = true,
		debug = true,
	},
	-- closing_tags = {
	--   highlight = "ErrorMsg", -- highlight for the closing tag
	--   prefix = ">", -- character to use for close tag e.g. > Widget
	--   enabled = true -- set to false to disable
	-- },
	dev_log = {
		enabled = true,
		--open_cmd = ":silent !tmux split-window -dh",
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
	dev_tools = {
		autostart = false, -- autostart devtools server if not detected
		auto_open_browser = false, -- Automatically opens devtools in the browser
	},
	outline = {
		open_cmd = "50vnew", -- command to use to open the outline buffer
		auto_open = false, -- if true this will open the outline automatically when it is first populated
	},
	lsp = {
		color = { -- show the derived colours for dart variables
			enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
			background = false, -- highlight the background
			foreground = false, -- highlight the foreground
			virtual_text = true, -- show the highlight using virtual text
			virtual_text_str = "■", -- the virtual text character to highlight
		},
		on_attach = on_attach,
		capabilities = capabilities,
		-- capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
		-- --- OR you can specify a function to deactivate or change or control how the config is created
		--capabilities = function(config)
		--  return config
		--end,
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			-- analysisExcludedFolders = {<path-to-flutter-sdk-packages>}
		},
	},
})
---- template
--lspconfig[''].setup({
--  capabilities = capabilities,
--  on_attach = on_attach
--})
