regulations, strokes = [list(map(int, input().split(","))) for _ in range(2)]

SCORE_MAP = {
    -4: "コンドル",
    -3: "アルバトロス",
    -2: "イーグル",
    -1: "バーディ",
    0: "パー",
    1: "ボギー",
}

results = []
result = ""
for regulation, stroke in zip(regulations, strokes):
    score = stroke - regulation

    if stroke == 1 and regulation != 5:
        result = "ホールインワン"
    elif score >= 2:
        result = str(stroke - regulation) + "ボギー"
    else:
        result = SCORE_MAP[score]

    results.append(result)
print(",".join(results))
