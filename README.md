# Nvim-config

Este diretório contém um setup pessoal de Neovim configurado em Lua, com foco em produtividade para desenvolvimento web, Lua, TypeScript, C/C++ e C#.

## Visão geral

O ambiente foi montado com:

- `lazy.nvim` como gerenciador de plugins
- `nvim-tree` para navegação em árvore de arquivos
- `telescope` para busca rápida
- `nvim-cmp` + `Luasnip` para autocomplete e snippets
- `mason.nvim` + `mason-lspconfig.nvim` para instalação de servidores LSP
- `conform.nvim` para formatação, com ferramentas instaladas pelo Mason
- `nvim-lint` + `eslint_d` para lint de JavaScript e TypeScript
- `nvim-treesitter` para highlighting e indentação mais robusta
- `lspsaga.nvim` para UI de LSP melhorada
- `lualine.nvim` para statusline
- `Comment.nvim`, `vim-surround`, `vim-ReplaceWithRegister`, `vim-maximizer` e `vim-tmux-navigator` para ergonomia

## Estrutura principal

- `init.lua` — ponto de entrada do setup
- `lua/lusca/core/options.lua` — opções globais do editor
- `lua/lusca/core/keymaps.lua` — atalhos de teclado
- `lua/lusca/core/colorscheme.lua` — tema visual
- `lua/lusca/plugins-setup.lua` — declaração e instalação de plugins com Lazy
- `lua/lusca/plugins/` — módulos de configuração dos plugins
- `lazy-lock.json` — versões exatas dos plugins instalados
- `NEOVIM-CHEAT-SHEET.md` — fundamentos e fluxo diário no Neovim
- `TMUX-CHEAT-SHEET.md` — sessões, janelas, painéis e integração com Neovim

## Dependências

### Obrigatórias

- Neovim 0.11 ou mais recente
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
- `emmet_language_server`
- `clangd`
- `ts_ls`
- `omnisharp`
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

O `lazy.nvim` e os plugins serão instalados automaticamente na primeira execução. Para sincronizar manualmente:

```vim
:Lazy sync
```

Para inspecionar plugins, atualizações e erros, use `:Lazy`.

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

- `tmux/tmux.conf`

### Principais escolhas da configuração

- Prefixo do tmux: `Ctrl-a`
- Plugin manager: `tpm`
- Plugin de navegação com Neovim: `christoomey/vim-tmux-navigator`
- Tema: `tmux-themepack` com visual `powerline/block/cyan`

### Atalhos úteis do tmux

- `Ctrl-a |` — divide a janela horizontalmente
- `Ctrl-a -` — divide a janela verticalmente
- `Ctrl-a r` — recarrega a configuração do tmux
- `Ctrl-a h/j/k/l` — seleciona outro painel
- `Ctrl-a` + setas — redimensiona o painel

### Uso combinado com o Neovim

O plugin `vim-tmux-navigator` ajuda a manter a navegação entre splits do Neovim e panes do tmux mais fluida, especialmente em fluxos de desenvolvimento com terminal + editor lado a lado.

Consulte os guias completos:

- [Guia diário de Neovim](NEOVIM-CHEAT-SHEET.md)
- [Guia diário de tmux](TMUX-CHEAT-SHEET.md)

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

- A configuração usa `conform.nvim` para formatar Lua, web, JSON, Markdown, YAML, C e C++ ao salvar.
- JavaScript e TypeScript são verificados pelo `eslint_d` ao entrar, sair do modo de inserção e salvar o buffer.
- Em linguagens sem formatter configurado, como C#, o Conform usa o LSP como fallback.
- `<leader>f` formata manualmente o arquivo ou a seleção atual.
- O tema principal configurado é `nightfly`.

## Dica rápida

Se o ambiente estiver com erro de plugin ou LSP, a sequência mais comum é:

```vim
:Lazy sync
:Mason
:checkhealth
```
