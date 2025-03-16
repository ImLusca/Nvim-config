local opt = vim.opt

opt.relativenumber = true;
opt.number = true

-- tab
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.autoindent = true

--wrap de linha
opt.wrap = false

--busca
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--fix backspace
opt.backspace = "indent,eol,start"


--fix clipboard
opt.clipboard:append("unnamedplus")

-- mandando tmux pra casa do caralho
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
