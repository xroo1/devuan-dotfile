#!/bin/bash

# Obtém o sink padrão
sink=$(pactl get-default-sink)

# Verifica se o sink está mudo
if pactl get-sink-mute "$sink" | grep -q "Mute: yes"; then
    echo "󰝛  Mute"
else
    # Obtém o volume do sink padrão (primeiro canal)
    volume=$(pactl get-sink-volume "$sink" | grep -oP '\d+%' | head -1)
    echo "  $volume"
fi
