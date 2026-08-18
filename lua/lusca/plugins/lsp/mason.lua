local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "cssls",
    "tailwindcss",
    "lua_ls",
    "emmet_language_server",
    "clangd",
    "ts_ls",
    "omnisharp",
  },
  automatic_enable = false,
})

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
    "clang-format",
  },
  run_on_start = true,
  start_delay = 1000,
  debounce_hours = 24,
})
