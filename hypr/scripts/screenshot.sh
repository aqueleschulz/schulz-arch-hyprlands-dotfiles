#!/bin/bash

# Trava para evitar múltiplos processos de print empilhados
LOCKFILE="/tmp/screenshot.lock"

if [ -f "$LOCKFILE" ]; then
    exit 0
fi

touch "$LOCKFILE"

# Tira o print da área selecionada e copia para a área de transferência
grim -g "$(slurp)" - | wl-copy

# Remove a trava ao finalizar
rm -f "$LOCKFILE"
