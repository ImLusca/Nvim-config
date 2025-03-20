vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i","jk","<ESC>")
keymap.set("n", "x,", '"_x"')

keymap.set("n","<leader>m", "<C-a>")
keymap.set("n","<leader>=", "<C-x>")
keymap.set("n","<leader>e", ":Explore<CR>", { noremap = true, silent = true })
keymap.set("n","<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n","<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

--mandando tmux pro krl
keymap.set("n","<leader>sv", "<C-w>v")
keymap.set("n","<leader>sh", "<C-w>s")
keymap.set("n","<leader>sx", ":close<CR>")
keymap.set("n","<leader>se", "<C-w>=")
keymap.set("n","<leader>sm",":MaximizerToggle<CR>")


keymap.set("n","<leader>to", ":tabnew<CR>")
keymap.set("n","<leader>tx", ":tabclose<CR>")
keymap.set("n","<leader>tn", ":tabn<CR>")
keymap.set("n","<leader>tp", ":tabp<CR>")

--nvim-tree
keymap.set("n","<leader>e", ":NvimTreeToggle<CR>")

--telescope
keymap.set("n","<leader>ff","<cmd>Telescope find_files<cr>")
keymap.set("n","<leader>fs","<cmd>Telescope live_grep<cr>")
keymap.set("n","<leader>fc","<cmd>Telescope grep_string<cr>")
keymap.set("n","<leader>fb","<cmd>Telescope buffers<cr>")
keymap.set("n","<leader>fh","<cmd>Telescope help_tags<cr>")

keymap.set("n","<leader>t",":vsplit | term<cr>")
