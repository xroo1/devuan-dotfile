#!/bin/bash
C2='\033[32m'
C0='\033[0m'


install_dependencies () {
  echo -e "\n${C2}[+]${C0} Iniciando instalação do dotfile "
  echo -e "${C2}[+]${C0} Instalando Depedencias "
  sudo apt install brightnessctl pulseaudio-utils xinput feh scrot imagemagick xclip neovim feh dunst i3lock ranger  
}

install_st () {
  echo -e "\n${C2}[+]${C0} Instalando Depedencias do ST."
  sudo apt install libx11-dev libxft-dev libxext-dev

  echo -e "\n${C2}[+]${C0} Compilando o ST Term"
  cd ./config/st/
  sudo make clean install 
}

setup_ranger_default () {
  echo -e "\n${C2}[+]${C0} Adicionando o Ranger como explorador de arquivos padrao."
  mkdir -p ~/.local/share/applications

  DESKTOP_FILE="$HOME/.local/share/applications/ranger-st.desktop"

  
  echo -e "${C2}[*]${C0} Criando arquivo .desktop com configurações."
cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Name=Ranger (st)
Comment=Abrir Ranger no terminal st
Exec=st -e ranger %u
Icon=utilities-terminal
Terminal=false
MimeType=inode/directory;
EOF

  echo -e "${C2}[*]${C0} Dando permicao de executavel para arquivos de configuração"
  chmod +x "$DESKTOP_FILE"

  echo -e "${C2}[*]${C0} Definindo o Ranger como padrao para abrir diretorios."
  # 5. Definir o Ranger (via st) como o padrão para abrir pastas (diretórios)
  xdg-mime default ranger-st.desktop inode/directory
}


deploy_dots () {
  echo -e "\n${C2}[+]${C0} Copiando arquivos"
  cp -v fonts -r ~/.fonts
  cp -v config/* -r ~/.config/
  cp -v script -r ~/.scripts

  echo -e "${C2}[*]${C0} Instalando fonts"
  fc-cache -fv ~/.fonts

  echo -e "${C2}[*]${C0} Dando permicao de executavel para arquivos de configuração"
  chmod +x ~/.config/i3blocks/scripts/*

  echo -e "${C2}[+]${C0} Adicionando Wallpaper "
  feh --bg-scale '/home/roo1/Downloads/devuan-dotfile/config/backgrounds/076.png'
}


main () {
  install_dependencies
  install_st
  setup_ranger_default
  deploy_dots
  echo -e "\n${C2}[+]${C0} Instalação finalizada com sucesso  \n"
}


main
