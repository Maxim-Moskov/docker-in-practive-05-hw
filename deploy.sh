#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/Maxim-Moskov/docker-in-practive-05-hw.git"
TARGET_DIR="/opt/docker-in-practive-05-hw"

# Скачиваем (или обновляем) репозиторий в /opt
if [ -d "$TARGET_DIR/.git" ]; then
    echo "Репозиторий уже есть в $TARGET_DIR, обновляю..."
    git -C "$TARGET_DIR" pull
else
    echo "Клонирую репозиторий в $TARGET_DIR ..."
    git clone "$REPO_URL" "$TARGET_DIR"
fi

# Запускаем проект целиком
cd "$TARGET_DIR"
docker compose up -d

echo "Готово. Проверка: curl -L http://127.0.0.1:8090"
