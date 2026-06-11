# adr — orientação para agentes

Repositório **público** de documentação (PT-BR): fundamentos e templates do sistema
documental descrito no [`README.md`](./README.md). Sem código de aplicação — o único
executável é o CI estrutural.

## Regras de trabalho

- **Idioma:** conteúdo em português (BR); fontes citadas no idioma original.
- **Estrutura é contrato:** os 8 ensaios de `docs/fundamentos/` mantêm as seções
  `## Fundamento`, `## Adaptação` e `## Fontes`; toda fonte nova entra também em
  `docs/BIBLIOGRAFIA.md` com URL canônica e data de acesso. O CI
  (`scripts/ci-local.sh`) valida isso — rode-o antes de propor mudança.
- **Templates são neutros:** placeholders `<descritivos>`, exemplos 100% fictícios,
  nenhum nome real de produto, máquina ou pessoa.
- **Dogfooding:** mudança notável ganha entrada no `CHANGELOG.md [Unreleased]` no
  mesmo PR (é a Definition of Done documental do ensaio 04 aplicada a este repo).
- **Fluxo:** GitHub Flow — `main` + feature branches efêmeras
  (`feature/<slug>`, `fix/<slug>`, `docs/<slug>`); integração via PR; todo PR passa
  por verificação manual do mantenedor antes do merge.
- **Commits:** Conventional Commits; trailers de autoria assistida quando um agente
  gera o commit (ver o próprio ensaio 03).
- **`docs/ESTADO.md` é local-only** (gitignored): nunca versionar estado de sessão
  neste repositório.

## O que NÃO fazer

- Não adicionar workflows de CI auto-hospedados (repo público — só runners cloud).
- Não citar neste repositório bastidores de manutenção que não estejam já públicos.
- Não transformar os templates em exemplos preenchidos com dados reais.
