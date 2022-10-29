local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
opt.cursorcolumn = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
--opt.noshowmode = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- set so hello-world is a whole word, not two words
opt.iskeyword:append("-")

-- font setting for neovide and other gui based nvim-apps
opt.guifont = { "JetBrainsMono Nerd Font Mono", ":h15" }

-- set commands
-- format on write
-- highlight yanks
vim.cmd([[
  autocmd BufWritePre * lua vim.lsp.buf.format()
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}
]])

-- For use with dart-vim-plugin
--let g:dart_format_on_save=v:true
--let g:dartfmt_options = ['--fix', '--line-length 120']
--
--
--opt.list = true
--highlight IndentBlanklineChar guifg=#202020 gui=nocombine
--highlight CursorLine guibg=#21262d
--highlight CursorColumn guibg=#21262d
