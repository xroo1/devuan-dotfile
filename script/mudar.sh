#!/bin/bash

if [ "$1" != "-i" ] || [ "$3" != "-o" ] || [ -z "$2" ] || [ -z "$4" ]; then
  echo "Uso: $0 -i <string_antiga> -o <string_nova>"
  exit 1
fi

STRING_ANTIGA="$2"
STRING_NOVA="$4"

# Busca os arquivos que contêm a string antiga
ARQUIVOS=$(grep -rl "$STRING_ANTIGA" .)

# Substitui a string antiga pela nova em todos os arquivos encontrados
for arquivo in $ARQUIVOS; do
  echo "Editando: $arquivo"
  sed -i "s/${STRING_ANTIGA//\//\\/}/${STRING_NOVA//\//\\/}/g" "$arquivo"
done

echo "Substituição concluída."

