require("lusca.plugins-setup")
require("lusca.core.options")
require("lusca.core.keymaps")
require("lusca.core.colorscheme")
require("lusca.plugins.comment")
require("lusca.plugins.lualine")
require("lusca.plugins.nvim-tree")
require("lusca.plugins.telescope")
require("lusca.plugins.nvim-cmp")
require("lusca.plugins.lsp.mason")
require("lusca.plugins.lsp.treesitter")
require("lusca.plugins.lsp.null-ls")
require("lusca.plugins.lsp.lspsaga")
require("lusca.plugins.lsp.lspconfig")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
