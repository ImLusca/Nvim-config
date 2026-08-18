local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  ensure_installed = { "typescript", "tsx", "javascript", "lua", "json", "html", "css", "markdown", "markdown_inline", "yaml" },
  highlight = { enable = true },
  indent = { enable = true },
})
