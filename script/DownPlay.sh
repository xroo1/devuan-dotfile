#!/bin/bash

# Cores
C2='\033[32m'
C1='\033[33m'
C3='\033[36m'
C4='\033[35m'
CR='\033[31m'
C0='\033[0m'

# Banner
banner() {
  echo -e """${C2}
 ______               ____   
|   __ \.-----.-----.|_   |  
|      <|  _  |  _  | _|  |_ 
|___|__||_____|_____||______|
 
${C0}
  """
}

check_dependencies() {
  echo -e "\n${C2}[+]${C0} Verificando dependências..."
  
  if ! command -v yt-dlp &> /dev/null; then
    echo -e "${C1}[!]${C0} yt-dlp não encontrado!"
    echo -e "${C2}[+]${C0} Instalando yt-dlp..."
    
    if pip3 install yt-dlp --upgrade 2>/dev/null; then
      echo -e "${C2}[+]${C0} yt-dlp instalado com pip3"
    elif pip install yt-dlp --upgrade 2>/dev/null; then
      echo -e "${C2}[+]${C0} yt-dlp instalado com pip"
    elif sudo apt install -y yt-dlp 2>/dev/null; then
      echo -e "${C2}[+]${C0} yt-dlp instalado com apt"
    else
      echo -e "${CR}[-]${C0} Falha ao instalar yt-dlp!"
      echo -e "${C1}[!]${C0} Instale manualmente: pip install yt-dlp"
      exit 1
    fi
    
    if ! command -v yt-dlp &> /dev/null; then
      echo -e "${CR}[-]${C0} yt-dlp ainda não disponível, tentando localizar..."
      
      # Procurar em locais comuns
      if [ -f "$HOME/.local/bin/yt-dlp" ]; then
        export PATH="$HOME/.local/bin:$PATH"
      elif [ -f "/usr/local/bin/yt-dlp" ]; then
        export PATH="/usr/local/bin:$PATH"
      fi
    fi
  fi
  
  if ! command -v ffmpeg &> /dev/null; then
    echo -e "${C1}[!]${C0} ffmpeg não encontrado!"
    echo -e "${C2}[+]${C0} Instalando ffmpeg..."
    
    if command -v apt &> /dev/null; then
      sudo apt update && sudo apt install -y ffmpeg
    elif command -v pacman &> /dev/null; then
      sudo pacman -S --noconfirm ffmpeg
    fi
  fi
  
  if ! command -v yt-dlp &> /dev/null; then
    echo -e "${CR}[-]${C0} yt-dlp não disponível!"
    echo -e "${C1}[!]${C0} Execute: pip install yt-dlp"
    exit 1
  fi
  
  if ! command -v ffmpeg &> /dev/null; then
    echo -e "${CR}[-]${C0} ffmpeg não disponível!"
    echo -e "${C1}[!]${C0} Instale o ffmpeg primeiro!"
    exit 1
  fi
  
  echo -e "${C2}[+]${C0} yt-dlp: $(yt-dlp --version 2>/dev/null || echo "OK")"
  echo -e "${C2}[+]${C0} ffmpeg: OK"
}

setup_dirs() {
  echo -e "\n${C2}[+]${C0} Criando diretórios..."
  
  DOWNLOAD_DIR="$HOME/Music/YouTube"
  TEMP_DIR="$DOWNLOAD_DIR/temp"
  
  mkdir -p "$DOWNLOAD_DIR" "$TEMP_DIR"
  echo -e "${C2}[+]${C0} Diretório: $DOWNLOAD_DIR"
}

download_simple() {
  local url="$1"
  local type="$2"
  
  echo -e "\n${C2}[+]${C0} Baixando $type: $url"
  echo -e "${C2}[+]${C0} Isso pode demorar um pouco...\n"
  
  yt-dlp \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 2 \
    --embed-thumbnail \
    --add-metadata \
    --ignore-errors \
    --no-overwrites \
    --output "$DOWNLOAD_DIR/%(title)s.%(ext)s" \
    "$url"
  
  local result=$?
  
  if [ $result -eq 0 ]; then
    echo -e "\n${C2}════════════════════════════════════════${C0}"
    echo -e "${C2}[+]${C0} Download concluído!"
    echo -e "${C2}[+]${C0} Pasta: $DOWNLOAD_DIR"
    echo -e "${C2}════════════════════════════════════════${C0}"
    return 0
  else
    echo -e "\n${CR}════════════════════════════════════════${C0}"
    echo -e "${CR}[-]${C0} Falha no download!"
    echo -e "${C1}[!]${C0} Verifique a URL e sua conexão"
    echo -e "${CR}════════════════════════════════════════${C0}"
    return 1
  fi
}

download_single() {
  echo -e "\n${C3}[?]${C0} URL do YouTube: "
  read -r url
  
  if [ -z "$url" ]; then
    echo -e "${CR}[-]${C0} URL vazia!"
    return 1
  fi
  
  download_simple "$url" "vídeo"
}

download_playlist() {
  echo -e "\n${C3}[?]${C0} URL da playlist: "
  read -r url
  
  if [ -z "$url" ]; then
    echo -e "${CR}[-]${C0} URL vazia!"
    return 1
  fi
  
  echo -e "\n${C3}[?]${C0} Limite de vídeos? (Enter para todos): "
  read -r limit
  
  if [ -n "$limit" ] && [ "$limit" -gt 0 ]; then
    echo -e "${C2}[+]${C0} Baixando apenas os primeiros $limit vídeos"
    url="$url --playlist-end $limit"
  fi
  
  download_simple "$url" "playlist"
}

list_files() {
  echo -e "\n${C2}[+]${C0} Arquivos MP3 baixados:"
  echo -e "${C3}+-------------------------------------+${C0}"
  
  local files=("$DOWNLOAD_DIR"/*.mp3)
  local count=0
  local total_size=0
  
  if [ ! -f "${files[0]}" ]; then
    echo -e "${C1}[!]${C0} Nenhum arquivo encontrado"
    return
  fi
  
  for file in "$DOWNLOAD_DIR"/*.mp3; do
    if [ -f "$file" ]; then
      count=$((count + 1))
      local size=$(du -h "$file" | cut -f1)
      local size_bytes=$(du -b "$file" | cut -f1)
      local name=$(basename "$file")
      
      total_size=$((total_size + size_bytes))
      
      if [ $((count % 2)) -eq 0 ]; then
        printf "  ${C3}%3d${C0} %-70s ${C2}%s${C0}\n" "$count" "$name" "$size"
      else
        printf "  ${C4}%3d${C0} %-70s ${C2}%s${C0}\n" "$count" "$name" "$size"
      fi
    fi
  done
  
  if [ $total_size -gt 1073741824 ]; then
    total_human=$(echo "scale=2; $total_size/1073741824" | bc)
    total_human="${total_human}GB"
  elif [ $total_size -gt 1048576 ]; then
    total_human=$(echo "scale=2; $total_size/1048576" | bc)
    total_human="${total_human}MB"
  else
    total_human=$(echo "scale=2; $total_size/1024" | bc)
    total_human="${total_human}KB"
  fi
  
  echo -e "${C3}════════════════════════════════════════${C0}"
  echo -e "${C2}[+]${C0} Total: $count arquivos"
  echo -e "${C2}[+]${C0} Tamanho total: $total_human"
}

clean_temp() {
  echo -e "\n${C2}[+]${C0} Limpando arquivos temporários..."
  rm -rf "${TEMP_DIR:?}"/* 2>/dev/null
  echo -e "${C2}[+]${C0} ✅ Limpo!"
}

open_folder() {
  echo -e "\n${C2}[+]${C0} Abrindo pasta de downloads..."
  
  if command -v xdg-open &> /dev/null; then
    xdg-open "$DOWNLOAD_DIR"
  elif command -v open &> /dev/null; then
    open "$DOWNLOAD_DIR"
  else
    echo -e "${C1}[!]${C0} Pasta: $DOWNLOAD_DIR"
  fi
}

menu() {
  while true; do
    clear
    banner
    
    echo -e "  ${C2}1${C0}) Baixar vídeo individual"
    echo -e "  ${C2}2${C0}) Baixar playlist completa"
    echo -e "  ${C2}3${C0}) Listar arquivos baixados"
    echo -e "  ${C2}4${C0}) Abrir pasta de downloads"
    echo -e "  ${C2}5${C0}) Limpar temporários"
    echo -e "  ${C2}6${C0}) Sair"
    echo -ne "\n${C3}[?]${C0} Escolha [1-6]: "
    
    read -r choice
    
    case $choice in
      1) download_single ;;
      2) download_playlist ;;
      3) list_files ;;
      4) open_folder ;;
      5) clean_temp ;;
      6) 
        echo -e "\n${C2}[+]${C0} Até logo! 👋"
        exit 0
        ;;
      *) 
        echo -e "${CR}[-]${C0} Opção inválida!"
        sleep 1
        ;;
    esac
    
    echo -e "\n${C3}[*]${C0} Pressione ENTER para continuar..."
    read -r
  done
}

main() {
  banner
  check_dependencies
  setup_dirs
  menu
}

main
