#!/bin/bash
# okr-rollup: 주간보고 무인 생성 (launchd 또는 n8n에서 호출)
# 설치: mkdir -p ~/bin && cp automation/okr-weekly.sh ~/bin/okr-weekly.sh && chmod +x ~/bin/okr-weekly.sh
set -euo pipefail

VAULT="/Users/usuhwa/Library/CloudStorage/GoogleDrive-usuhwa2@gmail.com/내 드라이브/obsidian-vault/irene's workspace"
CLAUDE="/Users/usuhwa/.local/bin/claude"
LOG_DIR="$HOME/.local/log/okr-rollup"
mkdir -p "$LOG_DIR"
LOG="$LOG_DIR/weekly-$(date +%Y%m%d-%H%M).log"

cd "$VAULT"

"$CLAUDE" -p "주간업무보고 작성해줘. 무인 실행 모드다: okr-rollup 스킬의 무인 실행 모드 규칙(질문 금지, 파일명 중복 시 중단, 확인 필요 항목은 파일 끝 주석)을 따르고, 마지막에 생성 파일 경로와 기간을 한 줄로 출력해라. 주간보고 후 Monthly 백필 조건이 충족되면 그것도 수행해라." \
  --permission-mode acceptEdits \
  >> "$LOG" 2>&1

echo "[$(date '+%F %T')] done: $LOG" >> "$LOG_DIR/history.log"
