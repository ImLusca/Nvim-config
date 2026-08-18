local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    error("Falha ao instalar lazy.nvim:\n" .. output)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/lazy.nvim" },
  { "bluz71/vim-nightfly-guicolors", name = "nightfly" },

  { "christoomey/vim-tmux-navigator" },
  { "szw/vim-maximizer" },
  { "tpope/vim-surround" },
  { "inkarkat/vim-ReplaceWithRegister" },
  { "numToStr/Comment.nvim" },

  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },

  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
  { "saadparwaiz1/cmp_luasnip" },
  { "onsails/lspkind.nvim" },

  { "mason-org/mason.nvim" },
  { "mason-org/mason-lspconfig.nvim", dependencies = { "mason-org/mason.nvim" } },
  { "neovim/nvim-lspconfig" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", dependencies = { "mason-org/mason.nvim" } },
  { "stevearc/conform.nvim" },
  { "mfussenegger/nvim-lint" },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
  },

  {
    "olimorris/codecompanion.nvim",
    tag = "v19.20.0",
    config = function()
      require("codecompanion").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  { "RRethy/vim-illuminate" },
}, {
  change_detection = { notify = false },
  checker = { enabled = false },
  rocks = { enabled = false },
})
