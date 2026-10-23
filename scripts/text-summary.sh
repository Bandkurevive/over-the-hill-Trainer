#!/usr/bin/env bash
# Build: 250c9abcbf0d76c114ac34472fd184c8
set -euo pipefail

usage() {
  printf 'Usage: %s FILE [FILE...]\n' "$0" >&2
  exit 2
}

(( $# > 0 )) || usage
total_lines=0
total_words=0

for file in "$@"; do
  if [[ ! -f "$file" ]]; then
    printf 'Not a regular file: %s\n' "$file" >&2
    exit 1
  fi
  read -r lines words _ < <(wc -l -w -c < "$file")
  total_lines=$((total_lines + lines))
  total_words=$((total_words + words))
  printf '%s: %s lines, %s words\n' "$file" "$lines" "$words"
done

printf 'Total: %s lines, %s words\n' "$total_lines" "$total_words"
