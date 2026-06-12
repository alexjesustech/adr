#!/usr/bin/env bash
# CI estrutural do repositório — espelho exato do job de CI.
# Valida ESTRUTURA (arquivos obrigatórios, seções exigidas, links internos),
# nunca conteúdo editorial.
set -u
cd "$(git rev-parse --show-toplevel)"
fails=0
fail() { echo "✗ $1"; fails=$((fails + 1)); }
ok() { echo "✓ $1"; }

# 1. arquivos obrigatórios
for f in README.md LICENSE CHANGELOG.md CONTRIBUTING.md docs/BIBLIOGRAFIA.md; do
  [ -f "$f" ] && ok "$f" || fail "arquivo obrigatório ausente: $f"
done

# 2. os 8 ensaios de fundamentos existem e têm as 3 seções
for n in 01-adr 02-changelog-semver 03-conventional-commits 04-dod-documental \
         05-protocolo-de-estado 06-prd-brd 07-diretivas-guard 08-fluxo-de-branch; do
  f="docs/fundamentos/$n.md"
  if [ ! -f "$f" ]; then fail "ensaio ausente: $f"; continue; fi
  for sec in '## Fundamento' '## Adaptação' '## Fontes'; do
    grep -q "^$sec" "$f" || fail "$f sem seção '$sec'"
  done
  ok "$f"
done

# 3. templates obrigatórios
for f in templates/adr/0000-template.md templates/adr/0001-exemplo.md \
         templates/HANDOFF.md templates/CHANGELOG.md templates/PRD.md \
         templates/AGENTS.md templates/plans/AAAA-MM-DD-slug.md; do
  [ -f "$f" ] && ok "$f" || fail "template ausente: $f"
done

# 4. CHANGELOG tem seção [Unreleased]
grep -q '^## \[Unreleased\]' CHANGELOG.md || fail "CHANGELOG.md sem seção [Unreleased]"

# 5. ESTADO.md de sessão nunca rastreado (é local-only por definição)
if git ls-files --error-unmatch docs/HANDOFF.md >/dev/null 2>&1; then
  fail "docs/HANDOFF.md rastreado — deve ser local-only (.gitignore)"
fi

# 6. links markdown internos resolvem (apenas alvos relativos)
while IFS=: read -r src target; do
  [ -z "$target" ] && continue
  t="${target%%#*}"
  [ -z "$t" ] && continue
  case "$t" in http*|mailto:*) continue ;; esac
  case "$t" in *NNNN*|*AAAA-MM-DD*) continue ;; esac  # placeholders de template
  if [ ! -e "$(dirname "$src")/$t" ] && [ ! -e "$t" ]; then
    fail "link quebrado em $src → $target"
  fi
done < <(git grep -oE '\]\((\./|\.\./)[^)]+\)' -- '*.md' 2>/dev/null \
         | sed -E 's/\]\(([^)]+)\)/\1/' | sed 's/:(/:/')

if [ "$fails" -gt 0 ]; then
  echo "—— CI estrutural: $fails falha(s)"; exit 1
fi
echo "—— CI estrutural OK"
