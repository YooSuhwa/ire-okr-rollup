# 자동화: 매주 화요일 오전 주간보고 생성

launchd가 매주 **화요일 09:47**에 headless Claude Code로 주간보고를 생성한다 (무인 실행 모드: 질문 없이 진행, 파일명 중복 시 중단, 확인 필요 항목은 보고서 끝 `%% 확인 필요 %%` 주석).

## 구성

- `okr-weekly.sh`: vault에서 `claude -p "주간업무보고 작성해줘..."`를 실행하는 래퍼. 로그는 `~/.local/log/okr-rollup/`.
- `com.irene.okr-weekly.plist`: launchd 스케줄 (화 09:47). Mac이 그 시각에 잠들어 있으면 깨어날 때 실행됨.

## 설치 (재설치 시에도 동일)

홈 디렉토리 쓰기는 Claude 샌드박스 밖이므로 사용자가 직접 실행한다:

```bash
mkdir -p ~/bin && cp automation/okr-weekly.sh ~/bin/okr-weekly.sh && chmod +x ~/bin/okr-weekly.sh
cp automation/com.irene.okr-weekly.plist ~/Library/LaunchAgents/
launchctl unload ~/Library/LaunchAgents/com.irene.okr-weekly.plist 2>/dev/null
launchctl load ~/Library/LaunchAgents/com.irene.okr-weekly.plist
```

## 확인·해제·수동 실행

```bash
launchctl list | grep okr-weekly          # 등록 확인
launchctl unload ~/Library/LaunchAgents/com.irene.okr-weekly.plist   # 해제
bash ~/bin/okr-weekly.sh                  # 수동 실행 (n8n Execute Command에서도 이 스크립트 호출 가능)
```

## 주의

- 시간 변경: plist의 `Hour`/`Minute` 수정 후 unload → load.
- 실행마다 Claude 사용량이 소모된다 (1회당 대략 주간보고 1건 생성 분량).
- 무인 모드는 당일(화요일) 데일리가 비어 있으면 당일 활동만 생략하고 생성한다. 제출 전에 훑어보고 필요하면 "오늘 것 반영해서 갱신해줘"라고 요청.
