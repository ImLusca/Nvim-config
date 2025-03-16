--auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end


local status,packer = pcall(require, "packer")

if not status then
  return
end 

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("bluz71/vim-nightfly-guicolors")
   
  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use("szw/vim-maximizer")

  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
  
  use("numToStr/Comment.nvim") -- gcc para commentar

  use("nvim-tree/nvim-tree.lua") -- Grande gostoso

  use("nvim-tree/nvim-web-devicons") -- icones bunitinhos

  use("nvim-lualine/lualine.nvim") -- statusline Bunitinhos

  use("nvim-lua/plenary.nvim")
  use({"nvim-telescope/telescope-fzf-native.nvim",run ="make"})
  use({"nvim-telescope/telescope.nvim",branch="0.1.x"})
  
  -- autocomplete
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  --lsp
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim") 

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") 
  use("hrsh7th/cmp-nvim-lsp") 
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls



  if packer_bootstrap then
    require("packer").sync()
  end
end)
