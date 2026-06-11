# 03 — Conventional Commits e autoria assistida por IA

## Fundamento

A especificação *Conventional Commits* 1.0.0 define uma gramática leve para
mensagens de commit:

```
tipo(escopo opcional): descrição no imperativo

corpo opcional — o quê e por quê, não o como

rodapé(s) opcional(is)
```

Tipos consagrados: `feat` (nova funcionalidade → MINOR no SemVer), `fix` (correção
→ PATCH), e os auxiliares `docs`, `chore`, `refactor`, `test`, `perf`, `build`,
`ci`. `BREAKING CHANGE:` no rodapé (ou `!` após o tipo) sinaliza MAJOR. A gramática
existe para três consumidores: **pessoas** varrendo o histórico, **ferramentas**
que geram changelog e calculam a próxima versão, e **CI** que valida a mensagem.

Os rodapés seguem o formato de *trailers* do Git (`Chave: valor`), o mesmo
mecanismo de `Co-authored-by:` — convenção difundida pelas plataformas de
hospedagem para registrar coautoria.

## Adaptação

- **Título ≤ ~72 caracteres, imperativo, sem ponto final;** corpo presente sempre
  que a mudança não for trivial — explicando o *porquê* (o *como* está no diff).
- **Autoria assistida por IA declarada por trailers.** Quando um agente gera o
  commit, o histórico deve dizer isso de forma pesquisável. Padrões úteis:

  ```
  @ai-generated
  Co-Authored-By: <NomeDoModelo> <noreply@exemplo>
  ```

  e, em projetos onde toda mudança de agente passa por revisão humana obrigatória:

  ```
  @ai-generated
  @reviewed-by <handle-do-revisor>
  ```

  O par `@ai-generated`/`@reviewed-by` cria um contrato auditável: `git log
  --grep` responde "o que a IA escreveu?" e "quem revisou?". **A convenção exata é
  por repositório** — o arquivo de orientação de agentes (template
  [`AGENTS.md`](../../templates/AGENTS.md)) deve declará-la, e o agente deve
  conferi-la antes de commitar, nunca presumir.
- **Staging explícito como regra de segurança.** Agentes não usam `git add -A` /
  `git add .`: sempre caminhos específicos, conferindo `git status` antes do
  commit. O custo é trivial; o benefício é nunca empacotar um artefato local,
  segredo ou arquivo de outra tarefa por acidente.
- **Commit ≠ push.** No fluxo com agentes, o commit fecha a unidade de trabalho;
  o push é um ato separado que **exige decisão explícita** do operador (é a
  fronteira entre "registrado localmente" e "publicado").

## Fontes

- *Conventional Commits 1.0.0*. <https://www.conventionalcommits.org/pt-br/v1.0.0/>
- *Git documentation — git-interpret-trailers*. <https://git-scm.com/docs/git-interpret-trailers>
