#!/bin/bash
# ~/.config/hypr/scripts/toggle_audio.sh

# Obtém a lista de IDs numéricos de sinks de áudio disponíveis
SINKS=($(wpctl status | awk '/Sinks:/,/Sources:/' | grep '^[ ]*[*| ]*[0-9]\+\.' | tr -d '*.' | awk '{print $1}'))

if [ ${#SINKS} -lt 2 ]; then
    notify-send "Áudio" "Apenas um dispositivo de saída detectado." -i audio-card
    exit 0
fi

# Identifica o ID atual ativo
CURRENT=$(wpctl status | awk '/Sinks:/,/Sources:/' | grep '^*' | tr -d '*.' | awk '{print $1}')

# Alterna para o próximo sink da lista de forma cíclica
NEXT=""
FOUND=0
for id in "${SINKS[@]}"; do
    if [ $FOUND -eq 1 ]; then
        NEXT=$id
        break
    fi
    if [ "$id" == "$CURRENT" ]; then
        FOUND=1
    fi
end

# Se chegou ao final, pega o primeiro da lista
if [ -z "$NEXT" ]; then
    NEXT="${SINKS[0]}"
fi

# Altera o sink padrão no PipeWire
wpctl set-default "$NEXT"

# Descobre o nome descritivo do novo dispositivo para a notificação
DEVICE_NAME=$(wpctl inspect "$NEXT" | grep -i "node.description" | cut -d'"' -f2)
notify-send "Saída de Áudio Alterada" "${DEVICE_NAME:-Dispositivo ID $NEXT}" -i audio-card
