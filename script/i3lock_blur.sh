#!/bin/bash

# Caminho onde a imagem será salva
IMAGE_PATH="/tmp/i3lock_blur.png"

# Captura a tela
scrot $IMAGE_PATH

# Aplica o blur (ajuste o valor do blur conforme necessário)
convert $IMAGE_PATH -blur 0x8 $IMAGE_PATH

# Define a imagem como fundo do i3lock
i3lock -i $IMAGE_PATH

# Apaga a imagem após a execução
rm -r $IMAGE_PATH

