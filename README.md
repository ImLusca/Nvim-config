# Nvim-config

Este diretório contém um setup pessoal de Neovim configurado em Lua, com foco em produtividade para desenvolvimento web, Lua, TypeScript, C/C++ e C#.

## Visão geral

O ambiente foi montado com:

- `packer.nvim` como gerenciador de plugins
- `nvim-tree` para navegação em árvore de arquivos
- `telescope` para busca rápida
- `nvim-cmp` + `Luasnip` para autocomplete e snippets
- `mason.nvim` + `mason-lspconfig.nvim` + `mason-null-ls.nvim` para instalação de servidores LSP e ferramentas de formatação
- `nvim-treesitter` para highlighting e indentação mais robusta
- `lspsaga.nvim` para UI de LSP melhorada
- `lualine.nvim` para statusline
- `Comment.nvim`, `vim-surround`, `vim-ReplaceWithRegister`, `vim-maximizer` e `vim-tmux-navigator` para ergonomia

## Estrutura principal

- `init.lua` — ponto de entrada do setup
- `lua/lusca/core/options.lua` — opções globais do editor
- `lua/lusca/core/keymaps.lua` — atalhos de teclado
- `lua/lusca/core/colorscheme.lua` — tema visual
- `lua/lusca/plugins-setup.lua` — declaração e instalação de plugins com Packer
- `lua/lusca/plugins/` — módulos de configuração dos plugins
- `plugin/packer_compiled.lua` — cache gerado pelo Packer

## Dependências

### Obrigatórias

- Neovim recente (recomendado 0.9+)
- Git
- make
- ripgrep (`rg`) para busca do Telescope

### Recomendadas

- Node.js + npm
  - usado em conjunto com ferramentas de LSP/formatters e para o ecossistema TypeScript/JavaScript
- GCC/Clang/LLVM
  - necessário para `clangd` e afins em projetos C/C++
- .NET SDK
  - útil para suporte a C# com `omnisharp`

### Plug-ins com instalação automática via Mason

O setup tenta instalar automaticamente via Mason os servidores e ferramentas abaixo:

- `html`
- `cssls`
- `tailwindcss`
- `lua_ls`
- `emmet_ls`
- `clangd`
- `prettier`
- `stylua`
- `eslint_d`
- `clang_format`

## Setup

### 1. Coloque o diretório como arquivo de configuração do Neovim

Se você estiver no Linux, normalmente o caminho esperado é:

```bash
mkdir -p ~/.config
ln -s /home/Lusca/Nvim-config ~/.config/nvim
```

### 2. Abra o Neovim e instale os plugins

```bash
nvim
```

Depois, execute dentro do Neovim:

```vim
:PackerSync
```

Na primeira execução, o `packer.nvim` será clonado automaticamente se ainda não estiver presente.

### 3. Instale os servidores LSP e formatters

Dentro do Neovim:

```vim
:Mason
```

Se a instalação automática estiver habilitada, parte dos binários pode ser baixada no primeiro uso, mas é útil abrir o Mason para validar o que está disponível.

### 4. Verifique o ambiente

```vim
:checkhealth
```

## Integração com tmux

Este setup também inclui uma configuração de tmux compatível com a navegação de janelas e splits do Neovim.

### Arquivo de configuração

A configuração principal do tmux fica em:

- `tmux/.tmux.conf`

### Principais escolhas da configuração

- Prefixo do tmux: `Ctrl-a`
- Plugin manager: `tpm`
- Plugin de navegação com Neovim: `christoomey/vim-tmux-navigator`
- Tema: `tmux-themepack` com visual `powerline/block/cyan`

### Atalhos úteis do tmux

- `Ctrl-a |` — divide a janela horizontalmente
- `Ctrl-a -` — divide a janela verticalmente
- `Ctrl-a r` — recarrega a configuração do tmux
- `Ctrl-a h/j/k/l` — redimensiona o painel

### Uso combinado com o Neovim

O plugin `vim-tmux-navigator` ajuda a manter a navegação entre splits do Neovim e panes do tmux mais fluida, especialmente em fluxos de desenvolvimento com terminal + editor lado a lado.

## Atalhos principais

- `jk` no modo insert → sai para Normal
- `<leader>e` → abre/fecha o `nvim-tree`
- `<leader>ff` → busca arquivo com Telescope
- `<leader>fs` → busca texto com Telescope
- `<leader>fc` → busca pela palavra sob o cursor
- `<leader>fb` → lista buffers
- `<leader>fh` → busca no help
- `<leader>sv` → split vertical
- `<leader>sh` → split horizontal
- `<leader>sm` → maximiza janela
- `<leader>t` → abre terminal vertical
- `<leader>ca` → code action com LSP
- `<leader>rn` → rename com LSP
- `K` → hover
- `[d` / `]d` → navegação entre diagnósticos
- `gcc` → comenta a linha atual com `Comment.nvim`

## Observações

- A configuração usa `null-ls` para formatação automática em `*.ts`, `*.tsx`, `*.js`, `*.jsx` e `*.json`.
- O `formatter` para C# é aplicado em `*.cs` com `vim.lsp.buf.format({ async = false })`.
- O tema principal configurado é `nightfly`.

## Dica rápida

Se o ambiente estiver com erro de plugin ou LSP, a sequência mais comum é:

```vim
:PackerSync
:Mason
:checkhealth
```
