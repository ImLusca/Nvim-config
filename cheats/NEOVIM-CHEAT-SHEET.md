# Guia diário de Neovim

Este guia combina os fundamentos do Neovim com os atalhos específicos deste setup.

## Notação

- `<leader>` — tecla de espaço neste setup
- `<C-x>` — `Ctrl+x`
- `<A-x>` — `Alt+x`
- `<CR>` — Enter
- `{movimento}` — uma direção ou objeto, como `w`, `}` ou `iw`
- Um número antes de um comando o repete: `5j`, `3w`, `2dd`

## Modos

| Tecla | Ação |
| --- | --- |
| `i` | inserir antes do cursor |
| `a` | inserir depois do cursor |
| `I` / `A` | inserir no início/fim da linha |
| `o` / `O` | criar linha abaixo/acima |
| `v` | seleção por caractere |
| `V` | seleção por linha |
| `<C-v>` | seleção em bloco/coluna |
| `:` | executar um comando |
| `<Esc>` ou `jk` | voltar ao modo Normal |

## Navegação

### Pela linha

| Tecla | Ação |
| --- | --- |
| `h j k l` | esquerda, baixo, cima, direita |
| `w` / `b` | próxima palavra / palavra anterior |
| `e` / `ge` | fim da próxima palavra / fim da anterior |
| `0` / `^` | início absoluto / primeiro caractere da linha |
| `$` | fim da linha |
| `f{char}` / `F{char}` | buscar caractere à frente/atrás na linha |
| `t{char}` / `T{char}` | ir até antes do caractere |
| `;` / `,` | repetir a busca de caractere / repetir ao contrário |
| `%` | alternar entre pares como `()`, `[]` e `{}` |

### Pelo arquivo

| Tecla | Ação |
| --- | --- |
| `gg` / `G` | primeira / última linha |
| `{` / `}` | parágrafo anterior / seguinte |
| `<C-u>` / `<C-d>` | subir / descer meia tela |
| `<C-b>` / `<C-f>` | subir / descer uma tela |
| `zz` | centralizar a linha atual |
| `:<número>` | ir para uma linha, por exemplo `:42` |

## Edição

| Tecla | Ação |
| --- | --- |
| `x` | apagar caractere sem alterar o registro de cópia |
| `r{char}` | substituir um caractere |
| `d{movimento}` | apagar, por exemplo `dw`, `d$`, `diw` |
| `dd` | apagar a linha |
| `c{movimento}` | apagar e entrar em Insert, por exemplo `ciw` |
| `cc` | substituir a linha |
| `y{movimento}` | copiar |
| `yy` | copiar a linha |
| `p` / `P` | colar depois / antes |
| `J` | juntar a próxima linha à atual |
| `u` / `<C-r>` | desfazer / refazer |
| `.` | repetir a última alteração |
| `>` / `<` em Visual | aumentar / diminuir indentação |
| `<A-j>` / `<A-k>` | mover a linha atual para baixo/cima |

Para apagar explicitamente sem copiar, use o registro vazio: `"_d{movimento}`.

### Objetos de texto

Objetos tornam alterações estruturais mais rápidas:

| Exemplo | Ação |
| --- | --- |
| `diw` / `daw` | apagar dentro da palavra / palavra com espaço |
| `ci"` / `ca"` | alterar dentro das aspas / incluindo as aspas |
| `ci(` / `ca(` | alterar dentro / ao redor dos parênteses |
| `di{` / `da{` | apagar dentro / ao redor das chaves |
| `vit` | selecionar o conteúdo de uma tag HTML |

## Busca e substituição

| Comando | Ação |
| --- | --- |
| `/{texto}` | buscar para frente |
| `?{texto}` | buscar para trás |
| `n` / `N` | próximo / resultado anterior |
| `*` / `#` | buscar a palavra sob o cursor para frente/trás |
| `:nohlsearch` | limpar destaque da busca |
| `:%s/antigo/novo/gc` | substituir no arquivo, pedindo confirmação |
| `:'<,'>s/antigo/novo/g` | substituir apenas na seleção visual |

As buscas ignoram maiúsculas por padrão, mas passam a diferenciá-las quando a consulta contém uma letra maiúscula.

## Arquivos, buffers e saída

| Comando | Ação |
| --- | --- |
| `:e arquivo` | abrir arquivo |
| `:w` / `:wa` | salvar atual / salvar todos |
| `:q` / `:qa` | fechar janela / sair de tudo |
| `:wq` ou `ZZ` | salvar e sair |
| `:q!` ou `ZQ` | sair descartando alterações |
| `:ls` | listar buffers |
| `:bnext` / `:bprevious` | próximo / buffer anterior |
| `:buffer {nome}` | trocar para um buffer |
| `:bdelete` | fechar o buffer atual |

Neste setup, `<leader>fb` é normalmente a maneira mais rápida de escolher um buffer.

## Explorer e Telescope

| Atalho | Ação |
| --- | --- |
| `<leader>e` | abrir/fechar o NvimTree |
| `<leader>ff` | procurar arquivo |
| `<leader>fs` | procurar texto no projeto com ripgrep |
| `<leader>fc` | procurar a palavra sob o cursor |
| `<leader>fb` | listar buffers |
| `<leader>fh` | pesquisar a documentação do Neovim |

Dentro do Telescope:

| Atalho | Ação |
| --- | --- |
| `<C-j>` / `<C-k>` | próximo / resultado anterior |
| `<CR>` | abrir resultado |
| `<C-q>` | enviar resultados selecionados ao quickfix |
| `<Esc>` | fechar |

## Janelas e abas

### Janelas (splits)

| Atalho | Ação |
| --- | --- |
| `<leader>sv` | split vertical |
| `<leader>sh` | split horizontal |
| `<leader>sx` | fechar janela atual |
| `<leader>se` | igualar tamanhos |
| `<leader>sm` | maximizar/restaurar janela |
| `<C-h/j/k/l>` | navegar entre splits e painéis do tmux |

Os comandos nativos equivalentes começam com `<C-w>`, como `<C-w>v`, `<C-w>s` e `<C-w>q`.

### Abas

| Atalho | Ação |
| --- | --- |
| `<leader>to` | nova aba |
| `<leader>tx` | fechar aba |
| `<leader>tn` / `<leader>tp` | próxima / aba anterior |
| `gt` / `gT` | próxima / aba anterior, nativo do Neovim |

Buffers, splits e abas são conceitos diferentes: um buffer contém um arquivo, uma janela mostra um buffer e uma aba organiza um conjunto de janelas.

## LSP e diagnósticos

| Atalho | Ação |
| --- | --- |
| `gd` | visualizar definição |
| `gD` | ir para declaração |
| `gi` | ir para implementação |
| `gf` | referências e definições com Lspsaga |
| `K` | documentação do símbolo |
| `<leader>ca` | ações de código |
| `<leader>rn` | renomear símbolo |
| `<leader>d` | diagnóstico do cursor |
| `<leader>D` | diagnósticos da linha |
| `[d` / `]d` | diagnóstico anterior / seguinte |
| `<leader>o` | abrir outline de símbolos |

Para TypeScript e JavaScript:

| Atalho | Ação |
| --- | --- |
| `<leader>oi` | organizar imports |
| `<leader>ru` | remover imports não usados |

Comandos úteis:

```vim
:LspInfo
:LspLog
:Mason
```

Projetos C/C++ funcionam melhor quando possuem `compile_commands.json`.

## Autocomplete e snippets

| Atalho | Ação |
| --- | --- |
| `<C-Space>` | abrir sugestões |
| `<C-j>` / `<C-k>` | sugestão seguinte / anterior |
| `<C-f>` / `<C-b>` | rolar documentação |
| `<Tab>` | confirmar a sugestão selecionada |
| `<C-e>` | cancelar autocomplete |

As sugestões combinam LSP, snippets, palavras do buffer e caminhos do sistema.

## Formatação e lint

- Arquivos suportados são formatados automaticamente ao salvar.
- `<leader>f` formata manualmente o arquivo ou a seleção.
- `stylua` formata Lua.
- `prettier` formata JavaScript, TypeScript, JSON, HTML, CSS, Markdown e YAML.
- `clang-format` formata C e C++.
- `eslint_d` verifica JavaScript e TypeScript.
- Quando não há formatter externo, o LSP é usado como fallback.

Comandos de diagnóstico:

```vim
:ConformInfo
:Mason
:checkhealth conform
```

O estilo de C/C++ pode ser personalizado com um arquivo `.clang-format` na raiz do projeto.

## Comentários e delimitadores

| Atalho | Ação |
| --- | --- |
| `gcc` | comentar/descomentar linha |
| `gc` em Visual | comentar/descomentar seleção |
| `cs"'` | trocar aspas duplas por simples |
| `ds"` | remover aspas ao redor do texto |
| `ysiw"` | colocar aspas ao redor da palavra |
| `gr{movimento}` | substituir texto pelo conteúdo do registro |

## Terminal integrado

| Atalho/comando | Ação |
| --- | --- |
| `<leader>t` | abrir terminal em split vertical |
| `<C-\><C-n>` | sair do modo Terminal para Normal |
| `i` | voltar a digitar no terminal |
| `:close` | fechar a janela do terminal |

Para processos duradouros, sessões e múltiplos terminais, prefira tmux.

## CodeCompanion

```vim
:CodeCompanionActions
:CodeCompanionChat
:CodeCompanionChat Toggle
```

Use a conclusão de comandos (`Tab`) após `:CodeCompanion` para descobrir as ações disponíveis na versão instalada.

## Manutenção e solução de problemas

```vim
:Lazy
:Lazy sync
:Mason
:LspInfo
:ConformInfo
:checkhealth
```

Fluxo rápido quando algo não estiver funcionando:

1. Execute `:Lazy sync` para sincronizar plugins.
2. Abra `:Mason` e confirme se a ferramenta está instalada.
3. Use `:LspInfo` dentro do arquivo afetado.
4. Use `:ConformInfo` para conferir o formatter.
5. Execute `:checkhealth` e procure erros relacionados ao componente.

