# 01 — ADR: registro de decisão de arquitetura

> Template correspondente: [`templates/adr/0000-template.md`](../../templates/adr/0000-template.md)
> · exemplo preenchido: [`templates/adr/0001-exemplo.md`](../../templates/adr/0001-exemplo.md)

## Fundamento

Michael Nygard propôs em 2011 o *Architecture Decision Record*: um documento curto,
versionado junto do código, que registra **uma** decisão arquiteturalmente
significativa — aquelas que afetam estrutura, características não-funcionais,
dependências, interfaces ou técnicas de construção. O formato original tem cinco
campos: **título**, **status** (proposto, aceito, deprecado, substituído),
**contexto** (as forças em jogo, em prosa neutra), **decisão** (voz ativa: "nós
faremos…") e **consequências** (todas — positivas, negativas e neutras).

Dois princípios sustentam o formato:

1. **Imutabilidade com substituição.** ADR aceito não se reescreve; decisão
   revertida gera um ADR novo que marca o antigo como substituído. A sequência
   numerada vira a linha do tempo do raciocínio do projeto — quem chega depois lê
   *por que* o sistema é assim, não só *como* ele é.
2. **Leveza deliberada.** Uma a duas páginas por decisão. Formatos mais pesados de
   documentação de arquitetura morrem por atrito; o ADR sobrevive porque cabe no
   fluxo de um PR.

A prática foi adotada amplamente: o Technology Radar da ThoughtWorks classifica
*Lightweight Architecture Decision Records* no anel **Adopt** (recomendação máxima),
e a organização [adr.github.io](https://adr.github.io/) consolida variantes — entre
elas o **MADR** (*Markdown Any Decision Records*), que estende o escopo para
"qualquer decisão relevante" e acrescenta campos opcionais como alternativas
consideradas e *drivers* da decisão.

## Adaptação

A prática descrita aqui segue Nygard com três ajustes, motivados por projetos em que
agentes de IA escrevem parte do código:

- **ADR ≠ plano de execução.** A fronteira mais comum de errar: o passo-a-passo
  *efêmero* de uma implementação (ordem de tarefas, comandos, checklists) **não** é
  ADR — vai para um plano descartável (`docs/plans/AAAA-MM-DD-slug.md`, template
  [aqui](../../templates/plans/AAAA-MM-DD-slug.md)) que perde valor após o merge.
  ADR registra o que é **caro de reverter** ou que o próximo desenvolvedor — humano
  ou agente — precisaria reconstruir do zero. Inflar a sequência de ADRs com planos
  degrada a linha do tempo (o leitor não distingue decisão durável de logística).
  Critério prático: *se a decisão for revertida em seis meses, alguém vai querer
  ler o racional original?* Se sim, ADR.
- **Agente propõe, ADR consolida.** Quando um agente de IA gera um plano de
  implementação que cristaliza decisão durável (escolha de biblioteca, modelo de
  autenticação, topologia), esse plano é materializado como ADR **antes** da
  execução — senão o racional morre no histórico da conversa, que nenhuma sessão
  futura lê.
- **Numeração por repositório, sem buracos retroativos.** `NNNN-titulo-curto.md`
  em `docs/adr/`, numeração sequencial simples. Repositórios-índice (meta-repos,
  monorepos de configuração) podem dispensar `docs/adr/` e registrar decisões de
  governança no changelog + arquivo de estado — o que importa é existir **um** lugar
  declarado por repositório.

## Fontes

- NYGARD, Michael. *Documenting Architecture Decisions*. Cognitect Blog, 15 nov. 2011.
  <https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions>
- *Architectural Decision Records* (organização ADR; inclui o MADR).
  <https://adr.github.io/> · <https://adr.github.io/madr/>
- THOUGHTWORKS. *Technology Radar — Lightweight Architecture Decision Records*
  (anel Adopt). <https://www.thoughtworks.com/radar/techniques/lightweight-architecture-decision-records>
