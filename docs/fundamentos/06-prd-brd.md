# 06 — PRD com objetivo de negócio embutido (BRD condicional)

> Template correspondente: [`templates/PRD.md`](../../templates/PRD.md)

## Fundamento

O *Product Requirements Document* é o contrato de escopo de um produto: problema,
visão, requisitos, não-objetivos e critérios de aceite. Marty Cagan (*Inspired*)
sintetiza o papel do documento de produto moderno: o valor não está no calhamaço,
mas em responder com clareza **o que** será construído, **para quem** e **como
saberemos que funcionou** — e, principalmente, em registrar o que ficou **fora**
(não-objetivos), que é onde o escopo morre ou sobrevive.

A tradição corporativa separa o *Business Requirements Document* (por que o negócio
quer isso; métricas; stakeholders) do PRD (o que o produto faz). Em organizações
grandes a separação faz sentido — autores diferentes, audiências diferentes. Em
projetos pequenos, ela produz dois documentos órfãos.

## Adaptação

- **PRD único em `docs/PRD.md`, vivo.** Atualizado conforme o produto evolui — PRD
  desatualizado é pior que ausente, porque mente com autoridade. A atualização é
  cláusula da DoD documental (ensaio [04](./04-dod-documental.md)): mudou
  requisito/escopo, mudou o PRD no mesmo PR.
- **BRD condicional, embutido, nunca arquivo separado.** Quando o produto tem
  **dimensão de negócio real** — usuários externos, monetização ou stakeholders
  distintos do desenvolvedor — o PRD **abre** com uma seção "Objetivo de negócio":
  o que o negócio deseja e por quê, métricas de sucesso, stakeholders. Produtos
  pessoais sem essa dimensão ficam isentos: o PRD sozinho basta.
- **Fronteira interna BRD ↔ PRD:** a seção de negócio responde *por quê / para
  quem*; o resto do PRD responde *o quê / como* (comportamento, requisitos,
  critérios de aceite). Não repetir um no outro — duplicação diverge.
- **Quem está isento de PRD:** repositórios-índice, tooling e bibliotecas de
  escopo auto-evidente — README + changelog cobrem. O PRD é para **produtos**
  (coisas com usuários e features).
- **Com agentes de IA, o PRD é insumo de prompt.** Agentes leem `docs/PRD.md` para
  decidir se uma mudança cabe no escopo; não-objetivos explícitos previnem que um
  agente "ajude" implementando o que foi deliberadamente excluído.

## Fontes

- CAGAN, Marty. *Inspired: How to Create Tech Products Customers Love*. 2ª ed.
  Wiley, 2018. ISBN 978-1119387503.
- SCHWABER, Ken; SUTHERLAND, Jeff. *The Scrum Guide*, 2020 (Product Backlog como
  fonte única de requisitos — o PRD aqui descrito cumpre papel análogo de fonte
  única de escopo). <https://scrumguides.org/>
