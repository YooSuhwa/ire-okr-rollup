---
name: okr-rollup
description: Obsidian vault의 데일리 노트·작업 로그로 업무 보고서를 만들 때 사용. 트리거 — "주간보고", "주간업무보고", "위클리 보고서", "okr weekly", "월간 보고", "okr monthly", "분기 보고", "분기 정리", "okr quarterly", "성과평가", "OKR 정리".
---

# OKR Rollup

데일리 노트(날짜·주제 뼈대)와 작업 로그·프로젝트 노트(상세 내용의 대부분)를 모아 Weekly / Monthly / Quarterly 보고서를 생성한다.

## 경로 (vault 루트 기준)

| 대상 | 경로 |
|---|---|
| 데일리 노트 | `20. Area/23. 주간보고·OKR/23-1. Daily/YYYY-MM-DD.md` (평일만) |
| OKR 마스터 (태그·KR·가중치 원본) | `20. Area/23. 주간보고·OKR/okr-master.md` |
| 작업 로그 | `10. Project/11. Log/*_log.md` |
| 프로젝트·회의·세미나 노트 | `10. Project/**` · `20. Area/21. 팀 운영/` · `30. Resource/34. 세미나·교육/` |
| Weekly 산출물 | `20. Area/23. 주간보고·OKR/Weekly/` |
| Monthly 산출물 | `20. Area/23. 주간보고·OKR/Monthly/` |
| Quarterly 산출물 | `20. Area/23. 주간보고·OKR/Quarterly/` |

- 날짜의 진실은 **파일명**이다. 노트의 `date created`는 백필되어 신뢰할 수 없다.
- vault 훅이 vault 밖 절대경로가 든 bash 명령을 차단한다 → Read/Grep/Glob 도구를 우선 사용하고, bash가 필요하면 vault 루트에서 상대 경로로 실행한다.
- `90. Settings/91. Templates/Template_11~13`은 낡았다(구 경로 Templater, 손상된 YAML) — **참조하지 않는다.** 구조가 불확실하면 Weekly/ 폴더의 최신 실물 보고서를 참조하되, **Part 2 형식만은 항상 weekly.md §6이 정본**이다(과거 실물의 Part 2는 구형식).

## 라우팅

| 요청 | 가이드 |
|---|---|
| 주간보고 / okr weekly | [references/weekly.md](references/weekly.md) |
| 월간 (직접 요청은 드묾 — 자동 백필됨) | [references/monthly.md](references/monthly.md) |
| 분기 / 성과평가 / okr quarterly | [references/quarterly.md](references/quarterly.md) |

## 실행 절차 — Weekly

1. **기간 결정** — weekly.md §1의 알고리즘(직전 보고서 종료일과 자기치유 정합). 결정한 기간과 근거를 **작성 전에 한 줄 보고**한다.
2. **소스 수집** — ① 기간 내 데일리 노트 ② 작업 로그의 기간 내 `# [[YYYY-MM-DD]]` 섹션 ③ 기간 내 수정된 프로젝트·회의·세미나 노트 (weekly.md §2).
3. **분류** — okr-master 기반 태그 추론(아래) + Part 2 카테고리 배치 (weekly.md §3·§6).
4. **작성** — weekly.md §4~§7의 골격 그대로 Weekly/에 **새 파일 1개** 생성 → §8 자체 점검 수행.
5. **월간 백필** — 직전 달이 끝났고 해당 Monthly가 없으면 monthly.md 절차로 생성하고 고지한다.

## 태그 추론

데일리 노트에는 `#okr` 태그가 없다(2026-03 이후). 태그는 항상 **okr-master.md의 매핑 태그 표에서 추론**한다.

- 접두어 → 상위과제: `ai활용/`→1 · `제품/`→2 · `검토/`→3 · `신규/`→4. 매핑 불가 항목은 `#기타`.
- 2026-05-06 이전 구형 데일리에 인라인 `#okr` 태그가 있으면 그것을 우선한다.

## 질문 원칙

추론이 기본이다. 질문은 ① 분류 근거가 실질 동률일 때 ② 상태(완료/진행)를 어떤 소스로도 판정할 수 없을 때 ③ 평일인데 데일리가 없어 휴무로 추정될 때 — 이때만, **작성 직전에 모아서 한 번에** 한다. 기간과 형식은 질문 대상이 아니다(알고리즘과 포맷 계약이 정답).

## 가드레일

- 쓰기는 Weekly/Monthly/Quarterly 폴더의 **신규 보고서 파일만.** 데일리·프로젝트 노트·okr-master 등 기존 노트는 어떤 경우에도 수정하지 않는다.
- **시크릿 금지**: API 키·토큰·서비스계정 키·클라우드 프로젝트 식별자 등 자격증명 값을 보고서에 옮기지 않는다. 사실 서술("키 노출 발견, rotate 권고")만 허용.
- 표 셀 안 위키링크의 파이프는 `\|`로 이스케이프한다.
