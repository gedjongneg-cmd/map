# 둘레 앱 장소 데이터

- `manifest.json`: 버전·파일 목록. 앱이 이 파일만 먼저 받아 버전이 바뀌었을 때 본문을 받는다.
- `curated.json`: 큐레이션 장소 (지역·등급·가격·영업시간·설명)
- `parks.json`: 놀이공원 (USJ 경계·놀이기구 좌표·구역)

갱신 순서: JSON 수정 → manifest.json의 version을 새 값으로 → 커밋·푸시. 앱은 켤 때 6시간마다 확인.
