# 0001 — Adotar SQLite como banco do MVP

> **Exemplo 100% fictício** — produto, time e números inventados para ilustrar o
> formato do [`0000-template.md`](./0000-template.md).

- **Status:** Aceito
- **Data:** 2026-03-14
- **Decisores:** dupla fundadora do produto "Listou" (app de listas colaborativas)

## Contexto

O MVP do Listou precisa persistir listas e itens para ~200 usuários de teste
fechado. O time é de duas pessoas, sem experiência operando banco gerenciado; o
orçamento de infraestrutura é zero até a validação. As consultas previstas são
simples (CRUD por usuário, sem agregações pesadas), mas o roadmap menciona
colaboração em tempo real no futuro — que exigiria outra solução de sincronização
de qualquer forma, independente do banco.

## Decisão

Nós usaremos **SQLite em arquivo único**, acessado pelo backend monolítico, para
todo o MVP. Backup por snapshot diário do arquivo. Postgres gerenciado foi
considerado e descartado por ora: custo fixo mensal e uma superfície operacional a
mais, sem nenhuma consulta prevista que o exija.

## Consequências

- (+) Zero custo e zero operação de banco durante a validação; deploy é copiar um
  binário e um arquivo.
- (+) Testes de integração rodam contra o banco real (em memória), sem container.
- (−) Escrita concorrente limitada — aceitável para 200 usuários, inviável se o
  teste fechado virar lançamento aberto. **Gatilho de revisão:** >50 escritas/s
  sustentadas ou necessidade de réplicas de leitura → novo ADR para migração.
- (−) O time precisa de disciplina nos snapshots: sem banco gerenciado, não há
  backup automático.
- (0) A colaboração em tempo real do roadmap não é afetada: seria um componente
  novo em qualquer cenário de banco.
