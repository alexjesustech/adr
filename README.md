# adr — sistema documental para projetos assistidos por IA

Fundamentos e templates, em português (BR), de um sistema documental completo para
projetos de software — pensado para o cenário em que **agentes de IA participam do
desenvolvimento** e a documentação versionada é a memória compartilhada entre
humanos, ferramentas e sessões.

O nome vem do artefato que abre o sistema — o **ADR** (Architecture Decision
Record) — mas o escopo é o conjunto:

| Prática | Ensaio | Template |
|---|---|---|
| Registro de decisões de arquitetura (ADR) | [`docs/fundamentos/01-adr.md`](./docs/fundamentos/01-adr.md) | [`templates/adr/`](./templates/adr/) |
| Changelog + versionamento semântico | [`docs/fundamentos/02-changelog-semver.md`](./docs/fundamentos/02-changelog-semver.md) | [`templates/CHANGELOG.md`](./templates/CHANGELOG.md) |
| Commits convencionais (e autoria assistida) | [`docs/fundamentos/03-conventional-commits.md`](./docs/fundamentos/03-conventional-commits.md) | — |
| Definition of Done documental | [`docs/fundamentos/04-dod-documental.md`](./docs/fundamentos/04-dod-documental.md) | — |
| Protocolo de estado entre agentes | [`docs/fundamentos/05-protocolo-de-estado.md`](./docs/fundamentos/05-protocolo-de-estado.md) | [`templates/HANDOFF.md`](./templates/HANDOFF.md) |
| PRD com objetivo de negócio embutido (BRD) | [`docs/fundamentos/06-prd-brd.md`](./docs/fundamentos/06-prd-brd.md) | [`templates/PRD.md`](./templates/PRD.md) |
| Diretivas operacionais nascidas de postmortem | [`docs/fundamentos/07-diretivas-guard.md`](./docs/fundamentos/07-diretivas-guard.md) | — |
| Fluxo de branch | [`docs/fundamentos/08-fluxo-de-branch.md`](./docs/fundamentos/08-fluxo-de-branch.md) | — |
| Orientação de agentes multi-LLM | (atravessa os ensaios 04 e 05) | [`templates/AGENTS.md`](./templates/AGENTS.md) |
| Plano efêmero de execução | (fronteira no ensaio 01) | [`templates/plans/`](./templates/plans/) |

Cada ensaio tem três partes: **fundamento** (o que a literatura estabelece),
**adaptação** (o que esta prática acrescenta ou ajusta — em especial para agentes de
IA) e **fontes** (citações verificáveis). A bibliografia consolidada está em
[`docs/BIBLIOGRAFIA.md`](./docs/BIBLIOGRAFIA.md).

## Status

`0.1.0` — em evolução. O sistema (templates + ensaios) é usável; a estrutura ainda pode mudar
([SemVer](https://semver.org/lang/pt-BR/) `0.y.z`).

## Adote em 15 minutos

1. Copie [`templates/CHANGELOG.md`](./templates/CHANGELOG.md) para a raiz do seu
   projeto e registre a primeira entrada em `[Unreleased]`.
2. Copie [`templates/adr/0000-template.md`](./templates/adr/0000-template.md) para
   `docs/adr/` e escreva o ADR 0001 com a decisão estrutural mais recente do
   projeto (o exemplo preenchido está em
   [`templates/adr/0001-exemplo.md`](./templates/adr/0001-exemplo.md)).
3. Se agentes de IA trabalham no projeto: copie
   [`templates/AGENTS.md`](./templates/AGENTS.md) para a raiz e
   [`templates/HANDOFF.md`](./templates/HANDOFF.md) para `docs/`, e adote a regra de
   ouro do ensaio 05 — *se não virar arquivo versionado, morre no chat*.
4. Adote a Definition of Done documental (ensaio 04): tarefa só está pronta quando
   a documentação afetada foi atualizada.
5. Produto com usuários? Copie [`templates/PRD.md`](./templates/PRD.md) para
   `docs/` e preencha começando pelo "Objetivo de negócio" (quando houver um).

## Estrutura

```
docs/
├── fundamentos/     # 8 ensaios — fundamento, adaptação, fontes
└── BIBLIOGRAFIA.md  # bibliografia consolidada com data de acesso
templates/           # reproduzíveis — copiar e usar
```

## Contribuindo

Issues e PRs são bem-vindos — ver [`CONTRIBUTING.md`](./CONTRIBUTING.md).
Mudanças passam por verificação manual do mantenedor antes do merge.

## Licença

[MIT](./LICENSE).
