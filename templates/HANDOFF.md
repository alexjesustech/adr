# Estado do <nome-do-projeto> — onde paramos

> Agentes (de qualquer ferramenta) DEVEM ler este arquivo no INÍCIO da sessão e
> ATUALIZÁ-LO no fim — incrementalmente, a cada decisão ou pendência fechada, não
> só no encerramento. É a memória compartilhada entre sessões e ferramentas: **se
> não virar arquivo versionado, morre no chat**; o handoff é o commit. Sem
> segredos/PII. Manter ENXUTO (< ~200 linhas).
>
> **Regra de rotação:** se a atualização de fim de sessão passar de ~200 linhas, a
> poda acontece na MESMA sessão — o excedente roda **verbatim** (nunca resumido)
> para `docs/HANDOFF-arquivo.md`, em blocos `## Rotação AAAA-MM-DD` (mais recente no
> topo). Por seção: Snapshot = só estado vigente (sessão concluída vira 1 entrada
> no Histórico; a narrativa longa vai para o arquivo); Pendências fechadas `- [x]`
> saem na rotação seguinte (abertas NUNCA rodam); Decisões = manter as últimas ~10;
> Histórico = manter as últimas ~8–10 entradas; Armadilhas rodam por OBSOLESCÊNCIA,
> nunca por idade. O arquivo morto não é leitura obrigatória de início de sessão.

## Snapshot atual
<!-- estado VIGENTE, curto, reescrito a cada sessão. Ponteiros, não duplicação. -->
- **Data / ferramenta:** AAAA-MM-DD / <ferramenta>
- **▶ RETOMADA (onde paramos):** <o ponto exato em que a lógica parou e o próximo
  passo imediato>

## Pendências abertas
<!-- ÚNICA lista de tarefas canônica no repositório. -->
- [ ] <pendência com contexto suficiente para outra sessão executá-la>

## Decisões recentes
<!-- ponteiros para ADR/changelog, não o racional inteiro. -->
- AAAA-MM-DD — **<decisão>** → <onde está registrada>

## Armadilhas / contexto que não está óbvio
<!-- SEMPRE com âncora arquivo:linha + link para ADR/commit. Proibida prosa vaga. -->
- <armadilha> — ver `<arquivo>:<linha>`

## Histórico de sessões (append-only — NUNCA reescrever)
<!-- log cronológico datado; rotação para docs/HANDOFF-arquivo.md conforme o cabeçalho -->
- **AAAA-MM-DD / <ferramenta>:** <o que a sessão produziu, em 2–5 linhas>
