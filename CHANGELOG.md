# Changelog

Todas as mudanças notáveis deste projeto são documentadas neste arquivo. O formato
segue o [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/) e o projeto
adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [Unreleased]

### Adicionado

- `llms.txt` (padrão [llmstxt.org](https://llmstxt.org/)) com o mapa navegável do
  repositório para consumo por LLMs, e `AGENTS.md` com a orientação de trabalho
  para agentes de IA que contribuam aqui (+ ponteiro `CLAUDE.md`).

## [0.1.0] - 2026-06-11

### Adicionado

- **Oito ensaios de fundamentos** em `docs/fundamentos/` — ADR, changelog +
  SemVer, Conventional Commits (com trailers de autoria assistida por IA),
  Definition of Done documental, protocolo de estado entre agentes, PRD com BRD
  condicional, diretivas GUARD (postmortem → regra permanente) e fluxo de branch —
  cada um com fundamento, adaptação e fontes.
- **Bibliografia consolidada** (`docs/BIBLIOGRAFIA.md`): 16 entradas com URL
  canônica e data de acesso.
- **Sete templates reproduzíveis** em `templates/`: ADR (formato Nygard) +
  exemplo fictício preenchido, `ESTADO.md` com regra de rotação, `CHANGELOG.md`,
  `PRD.md` com seção condicional de objetivo de negócio, `AGENTS.md` multi-agente
  e plano efêmero de execução.
- **CI estrutural** (`scripts/ci-local.sh` + GitHub Actions): arquivos
  obrigatórios, seções exigidas nos ensaios, links internos e a regra de que o
  estado de sessão nunca é versionado.
- `README.md` com o mapa do sistema e o roteiro "adote em 15 minutos";
  `CONTRIBUTING.md` com o fluxo de colaboração.
