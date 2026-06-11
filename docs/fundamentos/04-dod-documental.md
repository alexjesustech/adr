# 04 — Definition of Done documental

## Fundamento

O *Scrum Guide* (Schwaber & Sutherland, 2020) define a **Definition of Done** como
"uma descrição formal do estado do Incremento quando ele atende às medidas de
qualidade exigidas pelo produto". O ponto central: enquanto um item não satisfaz a
DoD, ele **não está pronto** — não é "pronto com ressalvas", não é "pronto, falta
só…". A DoD cria um compromisso verificável que protege o time da erosão gradual de
qualidade, porque tira a decisão de "está bom assim?" do calor de cada entrega.

A DoD clássica lista coisas como: código revisado, testes passando, build íntegro,
critérios de aceite atendidos. Documentação raramente aparece — e por isso
raramente acompanha o código.

## Adaptação

A **DoD documental** estende a Definition of Done com uma cláusula explícita:

> Uma feature, correção ou sessão de trabalho só está **pronta** depois que a
> documentação obrigatória afetada foi atualizada. **Documentação desatualizada =
> tarefa incompleta.**

Na prática, o checklist mínimo ao concluir qualquer tarefa:

1. **`CHANGELOG.md [Unreleased]`** ganhou entrada descritiva (ensaio
   [02](./02-changelog-semver.md)) — sempre, é o piso.
2. **`README.md`** atualizado se setup, uso ou comandos mudaram.
3. **PRD** atualizado se requisito ou escopo mudou (ensaio
   [06](./06-prd-brd.md)).
4. **ADR** novo se houve decisão durável, cara de reverter ou com trade-offs que o
   próximo desenvolvedor precisaria reconstruir (ensaio [01](./01-adr.md)).
5. **Arquivo de estado** atualizado, onde o projeto usa agentes (ensaio
   [05](./05-protocolo-de-estado.md)).

Por que elevar documentação a critério de pronto — e por que isso importa **mais**
com agentes de IA:

- Para um humano, documentar depois é procrastinação; para um agente, é
  **impossibilidade** — a sessão termina e o contexto evapora. Ou a documentação
  sai na mesma unidade de trabalho, ou sai errada/nunca.
- O agente seguinte (ou o mesmo modelo amanhã) **lê o repositório, não a
  conversa**. Documentação atualizada é o único canal de transferência confiável.
- A DoD documental é objetivamente verificável, então pode ser **automatizada em
  camadas**: regra social (revisão de PR) → hook local (push de mudança de conteúdo
  exige entrada nova em `[Unreleased]`) → gate de CI. Sempre com escape declarado e
  auditável — um bypass silencioso destrói a confiança no critério inteiro.

## Fontes

- SCHWABER, Ken; SUTHERLAND, Jeff. *The Scrum Guide*, nov. 2020, seção
  "Definition of Done". <https://scrumguides.org/>
- LACAN, Olivier. *Keep a Changelog* v1.1.0 (mecânica do `[Unreleased]`).
  <https://keepachangelog.com/pt-BR/1.1.0/>
