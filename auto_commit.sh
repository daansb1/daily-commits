#!/bin/bash

# Configuração
REPO_DIR="C:/Users/dbent/Documents/daily-commits"  # Caminho do repositório
BRANCH="main"  # Nome do branch principal

# Navega até o repositório
cd "$REPO_DIR" || { echo "Erro: Diretório não encontrado!"; exit 1; }

# Adiciona um log diário ao commit_log.txt
echo "Commit de $(date)" >> commit_log.txt

# Verifica se há mudanças no repositório
if ! git diff --quiet || ! git diff --staged --quiet; then
    git add .

    # Faz o commit com a data do dia
    git commit -m "Commit diário - $(date +%Y-%m-%d)"

    # Envia para o GitHub
    git push origin "$BRANCH"
    echo "✅ Commit e push realizados com sucesso!"
else
    echo "⚠️ Nenhuma alteração detectada. Criando um commit artificial..."

    # Cria um arquivo de marcação para garantir o commit
    echo "Commit artificial de $(date)" > .keep-commit

    git add .keep-commit
    git commit -m "Commit artificial para manter streak - $(date +%Y-%m-%d)"
    git push origin "$BRANCH"

    echo "✅ Commit artificial enviado para manter a sequência!"
fi