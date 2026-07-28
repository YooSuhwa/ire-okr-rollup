# ire-okr-rollup

Obsidian vault("irene's workspace")의 데일리 노트·작업 로그를 모아 주간업무보고(Weekly) · 월간(Monthly) · 분기(Quarterly) OKR 보고서를 생성하는 Claude Code 스킬.

## 구조

- `SKILL.md` — 엔트리: 경로 표 · 라우팅 · 실행 절차 · 태그 추론 · 가드레일
- `references/weekly.md` — 주간: 기간 자기치유 알고리즘 · 소스 수집 · 포맷 계약 · **Part 2 제출 규격**
- `references/monthly.md` — 월간: 자동 백필 전용 (사용자가 직접 실행하지 않음)
- `references/quarterly.md` — 분기: 성과평가 (Monthly 백필 → 통합)

## 설치

vault의 두 위치에 `SKILL.md` + `references/`를 복사한다:

- `<vault>/.claude/skills/ire-okr-rollup-git/`
- `<vault>/.agents/skills/ire-okr-rollup-git/`

git 설치기를 쓰는 경우 이 레포 **루트의 SKILL.md**를 읽는다. 설치 후 `references/`가 함께 복사됐는지 반드시 확인할 것 — 없으면 실행 절차가 동작하지 않는다.

## 유지보수 규칙

- **형식의 원본은 vault의 실물 보고서다.** 보고서 형식을 바꾸면 `references/weekly.md`의 포맷 계약을 함께 갱신한다.
- SKILL.md에는 형식 골격을 두지 않는다 — 골격은 references에만 (중복 → 모순 방지).
- Part 2의 canonical 예시는 실제 제출본 기준이다. 제출 형식이 바뀌면 weekly.md §6의 예시를 교체한다.
- 스킬을 zip(.skill)으로 다시 묶어 레포에 커밋하지 않는다 — 평문 파일이 유일한 진실 원천이다.
