# Nvim-config Cheat Sheet

## Modos e navegação rápida

- `jk` — sai do modo de inserção para Normal
- `x,` — apaga o caractere atual sem guardar no registro (`"_x`)
- `<A-j>` — move a linha para baixo
- `<A-k>` — move a linha para cima

## Uso com tmux

Este setup já vem com integração de tmux, usando o prefixo `Ctrl-a`.

### Atalhos principais do tmux

- `Ctrl-a |` — divide a janela horizontalmente
- `Ctrl-a -` — divide a janela verticalmente
- `Ctrl-a r` — recarrega a configuração do tmux
- `Ctrl-a h/j/k/l` — redimensiona o painel

### Fluxo recomendado

- use `Ctrl-a |` e `Ctrl-a -` para abrir painéis no tmux
- navegue entre editor e terminal com a ponte do `vim-tmux-navigator`
- combine isso com os splits do Neovim (`<leader>sv`, `<leader>sh`) para um fluxo de desenvolvimento mais ágil

## Leader key

O `<leader>` está configurado como espaço.

### Explorer e navegação

- `<leader>e` — abre/fecha o `nvim-tree`
- `<leader>sv` — divide janela verticalmente
- `<leader>sh` — divide janela horizontalmente
- `<leader>sx` — fecha janela atual
- `<leader>se` — iguala tamanho das janelas
- `<leader>sm` — alterna maximização da janela

### Abas

- `<leader>to` — nova aba
- `<leader>tx` — fecha aba
- `<leader>tn` — próxima aba
- `<leader>tp` — aba anterior

### Busca e pesquisa

- `<leader>ff` — encontra arquivo
- `<leader>fs` — pesquisa texto em toda a árvore de trabalho
- `<leader>fc` — pesquisa a palavra sob o cursor
- `<leader>fb` — lista buffers abertos
- `<leader>fh` — busca no help

### Terminal

- `<leader>t` — abre terminal em split vertical

## LSP e diagnóstico

- `gf` — `Lspsaga lsp_finder`
- `gD` — declaração da função/simbolo
- `gd` — peek de definição
- `gi` — implementação
- `<leader>ca` — code actions
- `<leader>rn` — rename
- `<leader>D` — mostra diagnósticos da linha
- `<leader>d` — mostra diagnóstico do cursor
- `[d` — diagnóstico anterior
- `]d` — diagnóstico seguinte
- `K` — hover da documentação
- `<leader>o` — outline

## TypeScript extra

- `<leader>rf` — renomeia arquivo e atualiza imports
- `<leader>oi` — organiza imports
- `<leader>ru` — remove imports não usados

## Comentários

- `gcc` — comenta/descomenta a linha atual

## Autocomplete

- `<C-j>` — move para a próxima sugestão
- `<C-k>` — move para a sugestão anterior
- `<C-b>` — rola a documentação para cima
- `<C-f>` — rola a documentação para baixo
- `<C-Space>` — mostra sugestões de autocomplete
- `<C-e>` — fecha a janela de autocomplete
- `<TAB>` — aceita a sugestão atual

## Comandos úteis para manutenção

```vim
:PackerSync
:Mason
:checkhealth
```

## Observações rápidas

- O tema principal é `nightfly`.
- A configuração mantém `relativenumber` e `number` ativos.
- O `clipboard` é integrado ao sistema com `unnamedplus`.
- Formatação automática acontece ao salvar arquivos suportados.
