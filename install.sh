#!/bin/bash
C2='\033[32m'
C0='\033[0m'


echo -e "\n${C2}Iniciando instalação do dotfile ${C0}\n"
echo -e "\n${C2}Instalando Depedencias  ${C0}\n"
sudo apt install brightnessctl pulseaudio-utils xinput feh scrot imagemagick xclip neovim feh dunst i3lock 

echo -e "\n${C2}[*]${C0} Copiando arquivos"
cp -v fonts -r ~/.fonts
cp -v config/* -r ~/.config/
cp -v script -r ~/.scripts

echo -e "\n${C2}[*]${C0} Instalando fonts"
fc-cache -fv ~/.fonts


echo -e "\n${C2}[*]${C0} Dando permicao de executavel para arquivos de configuração"
chmod +x ~/.config/i3blocks/scripts/*

echo -e "\n${C2}[*]${C0} Adicionando Wallpaper "
feh --bg-scale '/home/roo1/Downloads/devuan-dotfile/config/backgrounds/background.png'


echo -e "\n${C2}[*]${C0} Deseja adicionar e usar o ST TERM ao /usr/bin/ ? "

echo -e "${C2}[*]${C0} Digite 1 para sim e 0 para nao "
read opcao 
if [ "$opcao" == 1 ]; then 
  sudo cp -v config/st/st -r /usr/bin/
  sudo chmod -v +x /usr/bin/st
else
  echo -e "\n${C2}[*]${C0} Escolha uma terminal (digite o executavel, ex: xfce4-terminal) :  "
  read term
  ./script/mudar.sh -i "exec xfce4-terminal" -o "exec $term"


  echo -e "\n${C2}[*]${C0} verificando terminal  "
  ./script/busca.sh -s "exec $term"
  ./script/busca.sh -s "set \$term $term"
fi

echo -e "\n${C2}[+]${C0} Instalação finalizada com sucesso  \n"
