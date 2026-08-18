# Guia diário de tmux

Este setup usa `Ctrl-a` como prefixo. Quando o guia mostra `<prefix> c`, pressione `Ctrl-a`, solte e depois pressione `c`.

## Modelo mental

```text
servidor tmux
└── sessão (projeto ou contexto de trabalho)
    ├── janela 1 (editor)
    │   ├── painel 1 (Neovim)
    │   └── painel 2 (servidor)
    └── janela 2 (testes/logs)
```

- **Sessão:** continua existindo depois que você fecha o terminal ou desconecta do SSH.
- **Janela:** semelhante a uma aba, ocupa toda a área do terminal.
- **Painel:** divisão visível dentro de uma janela.

## Iniciar e retomar sessões

Comandos executados no shell:

```bash
# Criar uma sessão chamada projeto
tmux new-session -s projeto

# Forma curta
tmux new -s projeto

# Listar sessões
tmux list-sessions
tmux ls

# Retomar uma sessão
tmux attach-session -t projeto
tmux attach -t projeto

# Retomar a última sessão
tmux attach

# Criar em segundo plano
tmux new-session -d -s projeto
```

Se já houver um cliente conectado e você quiser assumir a sessão:

```bash
tmux attach -d -t projeto
```

## Sessões por dentro do tmux

| Atalho | Ação |
| --- | --- |
| `<prefix> d` | desconectar sem encerrar a sessão |
| `<prefix> s` | escolher sessão interativamente |
| `<prefix> $` | renomear sessão atual |
| `<prefix> (` / `<prefix> )` | sessão anterior / seguinte |
| `<prefix> L` | voltar à última sessão usada |

Comandos úteis no prompt do tmux (`<prefix> :`):

```text
new-session -s nome
switch-client -t nome
rename-session nome
kill-session -t nome
```

`kill-session` encerra os processos daquela sessão; use com cuidado.

## Janelas

| Atalho | Ação |
| --- | --- |
| `<prefix> c` | criar janela |
| `<prefix> ,` | renomear janela |
| `<prefix> n` / `<prefix> p` | próxima / janela anterior |
| `<prefix> 0` … `<prefix> 9` | ir para janela pelo número |
| `<prefix> w` | escolher janela ou sessão em uma árvore |
| `<prefix> l` | voltar à última janela |
| `<prefix> &` | encerrar janela, pedindo confirmação |

Também é possível usar:

```bash
tmux new-window -t projeto -n testes
tmux rename-window -t projeto:1 editor
tmux select-window -t projeto:editor
```

## Painéis

Os atalhos de divisão deste setup são:

| Atalho | Ação |
| --- | --- |
| `<prefix> \|` | dividir lado a lado |
| `<prefix> -` | dividir em cima/baixo |
| `<prefix> h/j/k/l` | selecionar painel à esquerda/baixo/cima/direita |
| `<prefix> ←/↓/↑/→` | redimensionar em passos de cinco células |
| `<prefix> z` | ampliar/restaurar o painel atual |
| `<prefix> x` | encerrar painel, pedindo confirmação |
| `<prefix> q` | mostrar os números dos painéis |
| `<prefix> {` / `<prefix> }` | mover painel para trás/frente |
| `<prefix> !` | transformar painel em uma nova janela |
| `<prefix> Espaço` | alternar layouts automáticos |

Os atalhos de seta para redimensionar são repetíveis: mantenha o prefixo ativo e pressione a seta várias vezes.

Para abrir divisões já em um diretório específico:

```bash
tmux split-window -h -c /caminho/do/projeto
tmux split-window -v -c /caminho/do/projeto
```

## Integração com Neovim

O plugin `vim-tmux-navigator` permite usar as mesmas teclas para atravessar splits do Neovim e painéis do tmux:

| Atalho direto | Direção |
| --- | --- |
| `<C-h>` | esquerda |
| `<C-j>` | baixo |
| `<C-k>` | cima |
| `<C-l>` | direita |

Esses atalhos não usam o prefixo. Se o cursor estiver no último split do Neovim naquela direção, a navegação passa para o painel do tmux.

## Scroll e copy mode

| Atalho | Ação |
| --- | --- |
| `<prefix> [` | entrar no copy mode e acessar o histórico |
| setas / `PageUp` / `PageDown` | navegar pelo histórico |
| `<C-s>` | buscar para frente no modo Emacs padrão |
| `<C-r>` | buscar para trás no modo Emacs padrão |
| `q` | sair do copy mode |

Para imprimir o conteúdo visível de um painel no shell:

```bash
tmux capture-pane -p
```

Para incluir o histórico e salvar em arquivo:

```bash
tmux capture-pane -p -S - > painel.log
```

## Comandos e inspeção

Abra o prompt interno com `<prefix> :`.

```text
list-sessions
list-windows
list-panes
display-message '#S:#I.#P'
source-file ~/.tmux.conf
```

Variáveis úteis:

- `#S` — nome da sessão
- `#I` — índice da janela
- `#W` — nome da janela
- `#P` — índice do painel

## Configuração e plugins

| Atalho | Ação |
| --- | --- |
| `<prefix> r` | recarregar `~/.tmux.conf` |
| `<prefix> I` | instalar plugins pelo TPM |
| `<prefix> U` | atualizar plugins pelo TPM |

Este repositório mantém a configuração em `tmux/tmux.conf`. Para usá-la como configuração principal:

```bash
ln -s /home/Lusca/Nvim-config/tmux/tmux.conf ~/.tmux.conf
```

## Fluxo recomendado por projeto

```bash
# Primeira vez
tmux new -s minha-api

# Em outro dia
tmux attach -t minha-api
```

Dentro da sessão:

1. Use a primeira janela para o Neovim.
2. Divida um painel com `<prefix> |` para servidor ou logs.
3. Crie uma janela com `<prefix> c` para testes.
4. Renomeie as janelas com `<prefix> ,`.
5. Ao terminar o dia, use `<prefix> d`; os processos continuam ativos.

## Comandos de encerramento

```bash
# Encerrar uma sessão específica
tmux kill-session -t projeto

# Encerrar todas as sessões, exceto a atual
tmux kill-session -a

# Encerrar completamente o servidor tmux e todas as sessões
tmux kill-server
```

Os comandos acima encerram processos que estiverem rodando dentro das sessões.

## Problemas comuns

### `no server running`

Não há nenhuma sessão ativa. Crie uma com `tmux new -s nome`.

### Navegação Neovim/tmux não funciona

1. Confirme que o TPM instalou os plugins com `<prefix> I`.
2. Recarregue a configuração com `<prefix> r`.
3. Execute `:Lazy sync` no Neovim.
4. Confirme que `vim-tmux-navigator` aparece em `:Lazy`.

### Cores incorretas

Confira dentro do tmux:

```bash
echo "$TERM"
```

Este setup define o terminal interno como `screen-256color`.

