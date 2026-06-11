# 07 — Diretivas GUARD: do postmortem à regra permanente

## Fundamento

A cultura de postmortem **blameless** — consolidada no capítulo "Postmortem
Culture: Learning from Failure" do livro de SRE do Google — estabelece que todo
incidente relevante gera um documento: o que aconteceu, impacto, causas-raiz e,
crucialmente, **itens de ação** que impedem a repetição. Sem culpabilizar pessoas:
o erro individual é sintoma; o alvo é o sistema que o permitiu.

O elo fraco da prática clássica está no destino dos itens de ação: viram tickets,
e tickets envelhecem. A lição do incidente fica registrada, mas não fica
**vigente**.

## Adaptação

A diretiva **GUARD** fecha esse elo: quando um postmortem revela uma classe de erro
que pode se repetir, a lição é promovida a **regra operacional permanente,
numerada e versionada** (GUARD-001, GUARD-002, …) no arquivo de orientação de
agentes do repositório raiz — exatamente onde humanos **e agentes de IA** a lerão
em toda sessão futura.

Anatomia de uma GUARD:

1. **Número e título** — citável e pesquisável (`grep GUARD-004`).
2. **Origem** — o incidente, anonimizado se necessário, que a motivou. A regra sem
   a história vira burocracia; a história explica o custo de ignorá-la.
3. **Regra em BLUF** (*bottom line up front*) — a proibição ou obrigação na
   primeira linha, detalhe depois.
4. **Gate de exceção** — como proceder quando a regra precisa ser contornada
   (tipicamente: confirmação explícita do operador + rollback declarado por
   escrito + validação pós-mudança). Regra sem válvula de escape documentada
   incentiva o bypass silencioso.

Exemplos do tipo de lição que merece GUARD (casos reais, generalizados):

- **Serviço parado não é serviço quebrado.** Um agente encontrou um runner de CI
  parado, leu como defeito e o religou — mas o operador o havia parado de
  propósito para liberar recursos. A GUARD resultante: agente não (re)liga serviço
  de infraestrutura que não parou na própria sessão sem consultar o registro de
  estado do stack e obter confirmação. *A intenção mora na documentação, não no
  estado do processo* — parada deliberada e crash são indistinguíveis olhando só o
  serviço.
- **Resolução de nomes do host nunca depende de um único container.** Um servidor
  de DNS em container caiu e cegou a máquina inteira porque o host apontava só
  para ele. A GUARD resultante: mudanças de rede/DNS exigem confirmação explícita,
  fallback público funcional **testado** (simulando a queda) e validação
  pós-mudança separando "rede ok" de "DNS ok".
- **Publicar exige passe de curadoria.** Um repositório publicado às pressas
  expôs nomes e diretrizes internas em comentários e rodapés. A GUARD resultante:
  todo artefato público passa por varredura de generalização — corpo, comentários,
  assets **e mensagens de commit** — contra uma denylist privada; em dúvida, não
  publica.

Por que isso importa mais com agentes: o agente executa com confiança e velocidade
exatamente os erros que o sistema permite, e **não tem a memória institucional**
do operador. A GUARD versionada é a forma de dar a ele (e a colaboradores novos) o
equivalente da cicatriz — sem precisar repetir o incidente.

## Fontes

- BEYER, Betsy; JONES, Chris; PETOFF, Jennifer; MURPHY, Niall (orgs.). *Site
  Reliability Engineering: How Google Runs Production Systems*. O'Reilly, 2016 —
  cap. "Postmortem Culture: Learning from Failure".
  <https://sre.google/sre-book/postmortem-culture/>
- *AGENTS.md — an open standard for AI agent instructions* (2025) — o veículo de
  vigência das diretivas para agentes. <https://agents.md/>
