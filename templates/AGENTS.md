# <nome-do-projeto> — orientação para agentes

> Template de `AGENTS.md` (padrão aberto <https://agents.md/>): a fonte ÚNICA de
> regras do repositório para QUALQUER agente de IA. Ferramentas que procuram outros
> nomes de arquivo recebem ponteiros: crie um `CLAUDE.md` contendo apenas
> `@AGENTS.md` (e equivalentes para outras ferramentas), nunca cópias — cópia
> diverge.

## O que é este projeto

<2–4 linhas: o que o repositório contém, stack, comando de build/teste canônico.>

## Regras de trabalho

- **Início de sessão:** `git fetch --prune` + `git status -sb` (comparar local ×
  remoto ANTES de editar); ler `docs/HANDOFF.md`.
- **Fim de sessão (Definition of Done documental):** atualizar
  `CHANGELOG.md [Unreleased]` + `docs/HANDOFF.md`; `README.md`/`docs/PRD.md` se
  setup/escopo mudou; ADR novo se houve decisão durável. **Documentação
  desatualizada = tarefa incompleta.**
- **Fluxo de branch:** `main` protegida; feature branches efêmeras
  (`feature/<slug>`, `fix/<slug>`, `chore/<slug>`) a partir da base atualizada;
  integração via PR. Pedido de feature novo com a sessão em branch de vida longa ⇒
  criar a branch ANTES de editar.
- **Commits:** Conventional Commits (`tipo(escopo): resumo` imperativo, ≤ ~72
  chars). Staging por caminho específico — NUNCA `git add -A` / `git add .`.
  Trailers de autoria assistida: <declare aqui a convenção do repo — ex.:
  `@ai-generated` + revisão humana>.
- **Push é ato separado:** nunca pushar sem pedido explícito do operador.
- **Segredos:** nunca em texto plano no repositório; nunca propor `cat`/`echo` de
  arquivos de credenciais. <Declare aqui o mecanismo do projeto.>

## Decisões e planos

- Decisão durável/cara de reverter ⇒ ADR em `docs/adr/` (formato Nygard).
- Passo-a-passo efêmero de execução ⇒ `docs/plans/AAAA-MM-DD-<slug>.md`,
  descartável após o merge. NÃO inflar a sequência de ADRs com planos.

## O que NÃO fazer

- <proibições específicas do projeto — serviços que não se religam, arquivos
  fora de escopo, diretórios de outros donos>
