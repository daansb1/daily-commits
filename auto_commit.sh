#!/bin/bash

# Configuração do repositório
REPO_DIR="C:/Users/dbent/Documents/daily-commits"  # Caminho do repositório
BRANCH="main"  # Nome do branch principal

# Acesse o diretório do repositório
cd "$REPO_DIR" || { echo "Erro: Diretório não encontrado!"; exit 1; }

# Cria um arquivo de controle diário para garantir commits
DATE=$(date +%Y-%m-%d)
echo "Commit artificial de $DATE" > commits/"$DATE".txt

# Adiciona os arquivos ao Git
git add .

# Faz o commit com a data do dia
git commit -m "Commit diário - $DATE"

# Envia para o GitHub
git push origin "$BRANCH"

echo "✅ Commit e push realizados com sucesso para $DATE!"