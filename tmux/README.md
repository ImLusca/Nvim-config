# Guia rápido do tmux e do LSP

Este arquivo resume a configuração atual do seu tmux e o que foi ajustado.

## 1. O que está configurado no tmux

No seu arquivo principal de configuração, as bindings atuais são:

- `h`, `j`, `k`, `l` → navegam entre painéis
- `Shift + h`, `Shift + j`, `Shift + k`, `Shift + l` → redimensionam os painéis

A recarga da configuração pode ser feita com:

```sh
tmux source-file ~/.tmux.conf
```

## 2. O que cada plugin faz

### TPM

O `TPM` (`tmux plugin manager`) é o gerenciador de plugins do tmux. Ele carrega e instala plugins a partir da seção de plugins do arquivo de configuração.

### tmux-themepack

Esse plugin altera a aparência do tmux, incluindo o tema visual e a barra de status.

### vim-tmux-navigator

Esse plugin ajuda a navegação entre painéis e com o editor Neovim/Vim em alguns fluxos.

## 3. Como saber se o TPM está funcionando

O ponto principal é verificar se o diretório de plugins contém os arquivos reais do `TPM` e dos plugins.

Se os diretórios estiverem vazios, o tmux não consegue carregá-los. Nesse caso, o ideal é reinstalar os plugins usando `git clone` novamente.

## 4. O motivo da migração no Neovim

A mensagem de depreciação veio de um uso antigo do `nvim-lspconfig` por meio do padrão:

```lua
require('lspconfig')
```

No Neovim moderno, a recomendação é usar a API nativa:

```lua
vim.lsp.config(name, opts)
vim.lsp.enable(name)
```

Isso é mais compatível com Neovim 0.11+ e evita o aviso de depreciação.

## 5. O que foi ajustado

A configuração de LSP foi migrada para a API atual, mantendo a mesma ideia de:

- `on_attach`
- `capabilities`
- configuração por servidor (`html`, `ts_ls`, `cssls`, `tailwindcss`, `emmet_ls`, `clangd`, `omnisharp`, `lua_ls`)

Também foi removida a dependência direta do pacote `nvim-lspconfig` do carregamento do plugin manager, já que o Neovim passou a oferecer essa funcionalidade nativamente.

## 6. Verificação rápida

A validação do setup do LSP foi feita em headless com o Neovim e retornou com sucesso:

```text
lspconfig ok
```

Isso indica que o arquivo de configuração de LSP agora carrega sem erro de sintaxe.
