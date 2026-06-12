# 05 — Protocolo de estado entre agentes

> Template correspondente: [`templates/HANDOFF.md`](../../templates/HANDOFF.md)

## Fundamento

Times distribuídos sempre dependeram de memória externa compartilhada — a tradição
de engenharia de software registra isso de muitas formas, do *project journal* ao
postmortem (o livro de SRE do Google dedica um capítulo a transformar memória de
incidente em documento durável e pesquisável). O princípio comum: **conhecimento que
vive na cabeça de alguém — ou numa conversa — não escala e não sobrevive**.

Com agentes de IA o problema fica agudo e literal. Cada ferramenta de agente mantém
memória interna própria (sessões, contexto, anotações), que: (a) **não é vista**
pelas outras ferramentas; (b) frequentemente não atravessa nem máquinas, nem
reinstalações; (c) evapora quando o contexto da conversa termina. O padrão aberto
`AGENTS.md` resolve o problema da **orientação** (instruções para qualquer agente
no repositório), mas não o do **estado**: onde o trabalho parou, o que falta, que
armadilhas existem.

## Adaptação

O protocolo de estado materializa uma regra de ouro:

> **Se não virar arquivo Markdown versionado, morre no chat.**
> O handoff entre agentes (e entre agente e humano) é o commit.

Mecânica — um arquivo `docs/HANDOFF.md` por repositório:

1. **Primeiro passo de qualquer sessão:** ler o `HANDOFF.md`. **Último passo:**
   atualizá-lo (data, ferramenta, onde a lógica parou, contextos implícitos).
   Atualizar **incrementalmente** a cada decisão ou pendência fechada — sessões
   terminam abruptamente, e o handoff não pode depender do encerramento limpo.
2. **Seções:** *Snapshot atual* (estado vigente, reescrito a cada sessão),
   *Pendências abertas* (checkboxes — a única lista de tarefas canônica no
   repositório), *Decisões recentes* (ponteiros para ADRs/changelog, não o racional
   inteiro), *Armadilhas* (contexto não-óbvio, sempre com âncora `arquivo:linha`) e
   *Histórico de sessões* (log datado, append-only).
3. **Regra de rotação:** o arquivo se mantém enxuto (< ~200 linhas). O excedente
   roda **verbatim** — nunca resumido, para manter auditável — para um
   `docs/HANDOFF-arquivo.md` append-only, em blocos datados. Sem rotação, o arquivo
   incha até nenhum agente o ler inteiro; com resumo em vez de rotação, perde-se o
   registro fiel.
4. **Uma sessão por working tree.** Duas sessões de agente no mesmo checkout
   sobrescrevem edições uma da outra e produzem documentação conflitante (caso
   real: duas ferramentas editando o mesmo repositório produziram trabalho
   duplicado e docs divergentes na mesma tarde). Paralelismo é legítimo — via
   worktrees do Git, um por sessão.
5. **Fronteiras:** changelog = o que mudou e ficou pronto; estado = onde parou e o
   que falta (ensaio [02](./02-changelog-semver.md)). Plano efêmero aprovado vira
   ADR ou arquivo em `docs/plans/` **antes** de executar (ensaio
   [01](./01-adr.md)) — não fica só na interface da ferramenta.
6. **Enforcement:** a prosa orienta, mas a trava real é determinística — um hook de
   pre-push que bloqueia mudança de conteúdo sem atualização do `HANDOFF.md` (com
   escape declarado), porque instrução em arquivo de orientação é contexto, não
   configuração imposta.

Em repositórios públicos, o `HANDOFF.md` é **local-only** (gitignored): estado de
sessão expõe bastidor e nomes de trabalho que não pertencem ao público.

## Fontes

- *AGENTS.md — an open standard for AI agent instructions* (2025).
  <https://agents.md/>
- BEYER, Betsy et al. (orgs.). *Site Reliability Engineering*. O'Reilly, 2016 —
  cap. "Postmortem Culture: Learning from Failure" (memória institucional como
  documento durável). <https://sre.google/sre-book/postmortem-culture/>
- *Git documentation — git-worktree*. <https://git-scm.com/docs/git-worktree>
