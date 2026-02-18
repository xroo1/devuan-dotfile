#!/bin/bash

if [ "$1" != "-s" ] || [ -z "$2" ]; then
  echo "Uso: $0 -s <string_para_buscar>"
  exit 1
fi

STRING="$2"

grep --color=always -rn "$STRING" .

