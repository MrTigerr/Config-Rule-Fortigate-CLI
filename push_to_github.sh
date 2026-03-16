#!/bin/bash
# ══════════════════════════════════════════════
# Script đẩy FortiGate Config Tool lên GitHub
# Chạy: bash push_to_github.sh
# ══════════════════════════════════════════════

USERNAME="manhdanmanhdan"
REPO="Config-Rule-Fortigate-CLI"
TOKEN="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"

echo "▶ Tao repo tren GitHub..."
curl -s -X POST \
  -H "Authorization: token $TOKEN" \
  -H "Content-Type: application/json" \
  https://api.github.com/user/repos \
  -d "{\"name\":\"$REPO\",\"description\":\"FortiGate-100F Security Config Tool & CLI Rules - TopCV\",\"private\":true}" \
  | grep -E '"html_url"|"message"'

echo ""
echo "▶ Init git va push files..."

git init
git config user.email "manhdanmanhdan@users.noreply.github.com"
git config user.name "manhdanmanhdan"
git add .
git commit -m "Initial commit - FortiGate Config Tool v3 + CLI rules"
git branch -M main
git remote add origin https://$TOKEN@github.com/$USERNAME/$REPO.git
git push -u origin main

echo ""
echo "✅ Xong! Repo: https://github.com/$USERNAME/$REPO"
