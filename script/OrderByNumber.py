import os

def renomear_imagens(caminho_pasta):
    try:
        # Obter todos os arquivos na pasta
        arquivos = os.listdir(caminho_pasta)
        # Filtrar apenas os arquivos de imagem
        imagens = [arquivo for arquivo in arquivos if arquivo.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif'))]
        
        # Ordenar os arquivos por nome original (se necessário)
        imagens.sort()
        
        # Renomear imagens
        for index, imagem in enumerate(imagens, start=1):
            extensao = os.path.splitext(imagem)[1]  # Mantém a extensão original
            novo_nome = f"{index:03d}{extensao}"  # Sequencial (imagem_001, imagem_002...)
            caminho_antigo = os.path.join(caminho_pasta, imagem)
            caminho_novo = os.path.join(caminho_pasta, novo_nome)
            os.rename(caminho_antigo, caminho_novo)
            print(f"Renomeado: {imagem} -> {novo_nome}")
        
        print("Renomeação concluída!")
    except Exception as e:
        print(f"Ocorreu um erro: {e}")

# Caminho para a pasta com as imagens
caminho_da_pasta = input("Digite o caminho da pasta com as imagens: ").strip()
renomear_imagens(caminho_da_pasta)

