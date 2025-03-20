local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
})

-- Auto format ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json" },
  callback = function()
    vim.lsp.buf.format()
  end
})
