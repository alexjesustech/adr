# 02 — Changelog e versionamento semântico

> Template correspondente: [`templates/CHANGELOG.md`](../../templates/CHANGELOG.md)

## Fundamento

O *Keep a Changelog* (Olivier Lacan, v1.1.0) parte de uma constatação: o log de
commits **não** é um changelog. Commits registram cada passo do trabalho; o
changelog registra, **para pessoas**, o que mudou de notável entre versões. Suas
regras centrais:

- Uma seção por versão, a mais recente no topo, com **data** em `AAAA-MM-DD`.
- Mudanças agrupadas por tipo: `Added` (Adicionado), `Changed` (Modificado),
  `Deprecated` (Obsoleto), `Removed` (Removido), `Fixed` (Corrigido),
  `Security` (Segurança).
- Uma seção **`[Unreleased]` sempre presente** no topo: acumula o que já foi
  mergeado mas ainda não versionado, e elimina o trabalho arqueológico de montar o
  changelog na hora do release.

O *Semantic Versioning* (Tom Preston-Werner, 2.0.0) dá semântica ao número de
versão `MAJOR.MINOR.PATCH`: **MAJOR** quebra compatibilidade da API pública,
**MINOR** adiciona funcionalidade compatível, **PATCH** corrige sem mudar
comportamento contratado. A premissa é declarar uma API pública; sem ela, os
números são decorativos.

As duas práticas se completam: o SemVer diz *quanto* mudou; o changelog diz *o quê*.

## Adaptação

- **`[Unreleased]` é o ponto de integração com a Definition of Done documental**
  (ensaio [04](./04-dod-documental.md)): toda feature ou correção mergeada entra em
  `[Unreleased]` no **mesmo PR** — não em um passe de documentação posterior, que
  na prática nunca acontece. Com agentes de IA isso vale dobrado: a entrada de
  changelog é o resumo da sessão que sobrevive ao contexto da conversa.
- **Fronteira changelog × arquivo de estado.** Em projetos com agentes, convivem
  dois documentos parecidos e de papéis opostos: o changelog registra **o que mudou
  e ficou pronto** (fato consumado, append-only, voltado ao leitor); o arquivo de
  estado (ensaio [05](./05-protocolo-de-estado.md)) registra **onde parou e o que
  falta** (volátil, reescrito por sessão, voltado ao próximo agente). Se um item
  aparece nos dois, o changelog descreve o resultado e o estado aponta o próximo
  passo — nunca o mesmo texto repetido.
- **Changelog também em projetos sem release formal.** Mesmo um repositório de
  configuração ou documentação se beneficia: o `[Unreleased]` vira o sumário
  navegável das mudanças notáveis, que o `git log` não oferece.
- **Enforcement progressivo.** Comece com a regra social (PR sem entrada de
  changelog não passa em revisão); quando houver CI, acrescente um gate que bloqueia
  push de mudança de conteúdo sem entrada nova em `[Unreleased]` — com escape
  declarado e documentado, nunca bypass silencioso.

## Fontes

- LACAN, Olivier. *Keep a Changelog* v1.1.0. <https://keepachangelog.com/pt-BR/1.1.0/>
- PRESTON-WERNER, Tom. *Semantic Versioning 2.0.0*. <https://semver.org/lang/pt-BR/>
