#!/bin/bash

# Pega o status e nível da bateria
info=$(acpi -b)
status=$(echo "$info" | awk '{print $3}' | tr -d ',')
percent=$(echo "$info" | awk '{print $4}' | tr -d ',%')
time=$(echo "$info" | awk '{print $5}')

# Ícones das fases de bateria
icons=(                            )

# Determina o ícone conforme o nível
if [ "$percent" -le 10 ]; then
    icon=${icons[0]}
elif [ "$percent" -le 30 ]; then
    icon=${icons[1]}
elif [ "$percent" -le 50 ]; then
    icon=${icons[2]}
elif [ "$percent" -le 80 ]; then
    icon=${icons[3]}
else
    icon=${icons[4]}
fi

# Define animação de carregamento se estiver carregando
if [ "$status" = "Charging" ]; then
    anim_icons=(" " " " " " " ")
    idx=$(( $(date +%s) % 4 ))
    icon=${anim_icons[$idx]}
    printf "%s %s%% (%s)\n" "$icon" "$percent" "$time"
elif [ "$status" = "Full" ]; then
    echo "   100%"
else
    echo "$icon $percent% ($time)"
fi

