# Contribuindo

Obrigado pelo interesse! Este repositório aceita colaboração aberta — issues para
discutir e PRs para propor mudanças.

## Regras

- **Idioma:** o conteúdo é em português (BR); fontes citadas permanecem no idioma
  original.
- **Toda afirmação de fundamento precisa de fonte** verificável: ensaios novos ou
  alterados mantêm a seção `## Fontes`, e a entrada correspondente entra em
  `docs/BIBLIOGRAFIA.md` com URL canônica e data de acesso.
- **Templates são neutros:** placeholders `<descritivos-entre-colchetes>`, sem
  nomes reais de produtos, máquinas ou pessoas. Exemplos preenchidos são fictícios.
- **Commits:** [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/)
  (`docs(fundamentos): …`, `feat(templates): …`). O ensaio 03 deste próprio
  repositório descreve a convenção, incluindo os trailers de autoria assistida por
  IA, se você os usar.
- **Changelog:** mudanças notáveis ganham entrada em `CHANGELOG.md [Unreleased]`
  no próprio PR (ensaios 02 e 04 explicam o porquê).

## Fluxo

1. Abra uma issue para mudanças de escopo (ensaio novo, reorganização) antes de
   investir no PR; correções pontuais podem ir direto de PR.
2. Fork → feature branch → PR para `main`.
3. O CI estrutural (`scripts/ci-local.sh`) precisa passar.
4. **Todo PR passa por verificação manual do mantenedor antes do merge** — inclui
   uma checagem de higiene do conteúdo; é normal o merge não ser imediato.
