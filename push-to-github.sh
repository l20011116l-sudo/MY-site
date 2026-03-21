#!/usr/bin/env bash
# 从 ../context-infrastructure/.env 读取 GITHUB_TOKEN 并推送到 GitHub（不修改 git remote）。
# 若仓库地址不同，请改下方 REPO_HTTPS（与 GitHub 仓库页「HTTPS」一致，勿含 token）。
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
ENV_FILE="$(cd "$ROOT/../context-infrastructure" && pwd)/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "找不到 $ENV_FILE"
  exit 1
fi

TOKEN=$(grep '^GITHUB_TOKEN=' "$ENV_FILE" | cut -d= -f2- | tr -d '\r' | head -1)
if [[ -z "${TOKEN}" ]]; then
  echo "GITHUB_TOKEN 为空：请在 context-infrastructure/.env 中填写并保存后再运行。"
  exit 1
fi

# 仓库名：My-site（GitHub 上需存在同名仓库，或先在网页端创建空仓库）
REPO_HTTPS="https://github.com/l20011116l-sudo/My-site.git"
USER="l20011116l-sudo"
PUSH_URL="https://${USER}:${TOKEN}@${REPO_HTTPS#https://}"

cd "$ROOT"
exec git push "$PUSH_URL" main:main
