# 08 — Fluxo de branch: Git Flow × GitHub Flow × trunk-based

## Fundamento

Três modelos dominam a discussão:

- **Git Flow** (Vincent Driessen, 2010): duas branches de vida longa (`master`
  estável + `develop` de integração), mais branches de feature, release e hotfix.
  Nasceu para software **versionado e entregue em releases** (desktop, bibliotecas,
  múltiplas versões em suporte). O próprio Driessen acrescentou ao artigo, em 2020,
  uma nota de reconsideração: para software de entrega contínua (web apps), o
  modelo é mais pesado que o necessário — recomenda algo como GitHub Flow.
- **GitHub Flow**: uma única branch de vida longa (`main`, sempre publicável);
  todo trabalho em feature branches efêmeras que entram via pull request. Simples,
  e o PR vira a unidade natural de revisão e CI.
- **Trunk-Based Development** (Paul Hammant): todos integram na trunk em commits
  pequenos e frequentes (ou branches que vivem horas); feature flags separam
  *deploy* de *release*. Otimiza para integração contínua extrema; exige disciplina
  de testes e flags madura.

A escolha não é estética: é função de **cadência de release**, tamanho do time e
custo de uma `main` quebrada.

## Adaptação

Regras práticas para projetos com agentes de IA no fluxo:

- **Default: GitHub Flow.** `main` única e protegida; uma branch por feature
  lógica (`feature/<slug>`, `fix/<slug>`, `chore/<slug>`, `refactor/<slug>` —
  slug em kebab-case curto); integração via PR. Git Flow só onde há releases
  versionados de verdade; trunk-based puro só com suíte de testes que o sustente.
- **Gatilho comportamental para agentes — pare antes de codar:** ao receber pedido
  de feature/fix novo com a sessão numa branch de vida longa, o agente **não começa
  a editar** — cria (ou propõe) a feature branch primeiro, a partir da base de
  integração **atualizada** (`git fetch` antes). Nunca ramificar de feature branch
  alheia: herda trabalho não-mergeado.
- **Uma branch por feature lógica.** Features independentes → branches
  independentes (PRs menores, revisão e reversão isoladas). Não empilhar mudanças
  sem relação na mesma branch.
- **Enforcement em camadas**, porque instrução é contexto e hook é trava:
  1. a regra escrita no arquivo de orientação de agentes;
  2. hook de pre-commit que **bloqueia commit direto na branch de vida longa**
     (com escape declarado para bootstrap e reconciliações);
  3. proteção de branch no servidor — a única camada que nenhum cliente contorna.
- **Verificar o remoto no início de toda sessão:** `git fetch --prune` + comparar
  local × remoto antes de editar. Um tracking ref desatualizado mente ("up to
  date" com a base vários commits atrás) e o agente constrói sobre base errada.

## Fontes

- DRIESSEN, Vincent. *A successful Git branching model* (2010; com a "note of
  reflection" de 2020).
  <https://nvie.com/posts/a-successful-git-branching-model/>
- GITHUB. *GitHub flow*.
  <https://docs.github.com/en/get-started/using-github/github-flow>
- HAMMANT, Paul. *Trunk Based Development*. <https://trunkbaseddevelopment.com/>
