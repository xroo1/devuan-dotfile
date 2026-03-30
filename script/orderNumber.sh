#!/usr/bin/env bash

renomear_arquivos() {
    local contador=1
    
    echo -e "\033[1;32m[*] \033[0m Renomeando todos os arquivos."
    for arquivo in *; do
        if [ -f "$arquivo" ]; then
            extensao="${arquivo##*.}"
            
            novo_nome=$(printf "%03d.%s" "$contador" "$extensao")
            
            if [ "$arquivo" != "$novo_nome" ]; then
                mv -v "$arquivo" "$novo_nome"
            fi
            
            ((contador++))
        fi
    done
}

main() {
    echo -e "\033[1;32m[+]\033[0m Iniciando renomeação em: $(pwd)"
    
    renomear_arquivos
    
    echo -e "\033[1;32mConcluído! Total de $(ls -1 | wc -l) arquivos processados.\033[0m]"
}

main

