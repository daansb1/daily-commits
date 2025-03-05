#!/bin/bash

# Diretório do repositório (altere para o caminho correto)
REPO_DIR="C:/Users/dbent/Documents/daily-commits"


# Muda para o diretório do repositório
cd "$REPO_DIR" || exit

# Adiciona um log diário no arquivo commit_log.txt
echo "Commit de $(date)" >> commit_log.txt

# Adiciona as mudanças ao Git
git add .

# Faz o commit com a data do dia
git commit -m "Commit diário - $(date +%Y-%m-%d)"

# Envia para o GitHub
git push origin main