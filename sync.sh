#!/bin/zsh
# 앱 번들의 JSON을 데이터 저장소로 복사하고 버전을 올려 GitHub에 푸시한다.
# 사용: ~/NeonTrip-data/sync.sh "설명"
set -e
cd ~/NeonTrip-data
cp ~/NeonTrip/App/NeonTrip/Resources/curated.json ~/NeonTrip/App/NeonTrip/Resources/parks.json ~/NeonTrip/App/NeonTrip/Resources/indoor.json .
V=$(date +%Y%m%d-%H%M)
N=$(python3 -c "import json; print(len(json.load(open('curated.json'))['places']))")
python3 - "$V" "$N" "${1:-갱신}" <<'PY'
import json, sys
v, n, note = sys.argv[1], sys.argv[2], sys.argv[3]
json.dump({"version": v, "files": ["curated.json", "parks.json", "indoor.json"], "note": f"{note} · {n}곳"}, open('manifest.json', 'w'), ensure_ascii=False, indent=1)
PY
git add -A
git -c user.name=susu -c user.email=jhkoo.skt@gmail.com commit -qm "${1:-갱신} ($V, ${N}곳)" || { echo "변경 없음"; exit 0; }
git push -q origin main && echo "푸시 완료: $V · ${N}곳"
