
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

  if client.name == "ts_ls" then
    keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({ apply = true, context = { only = { "source.organizeImports" } } })
    end, vim.tbl_extend("force", opts, { desc = "Organizar imports" }))
    keymap.set("n", "<leader>ru", function()
      vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused" } } })
    end, vim.tbl_extend("force", opts, { desc = "Remover imports nao usados" }))
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

local function setup_server(server_name, server_config)
  vim.lsp.config(server_name, server_config)
  vim.lsp.enable(server_name)
end

setup_server("html", {
  capabilities = capabilities,
  on_attach = on_attach,
})

setup_server("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

setup_server("cssls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

setup_server("tailwindcss", {
  capabilities = capabilities,
  on_attach = on_attach,
})

setup_server("emmet_language_server", {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

setup_server("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "cpp", "c" },
})

setup_server("omnisharp", {
  capabilities = capabilities,
  on_attach = on_attach,
})

setup_server("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
