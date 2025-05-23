regulations, strokes = [list(map(int, input().split(","))) for _ in range(2)]

results = []
result = ""
for regulation, stroke in zip(regulations, strokes):
    if stroke > regulation:
        if (stroke - regulation) == 1:
            result = "ボギー"
        else:
            result = str(stroke - regulation) + "ボギー"
    elif stroke == regulation:
        result = "パー"
    elif stroke == 1:
        if regulation == 5:
            result = "コンドル"
        else:
            result = "ホールインワン"
    elif (stroke - regulation) == -1:
        result = "バーディ"
    elif (stroke - regulation) == -2:
        result = "イーグル"
    elif (stroke - regulation) == -3 and regulation == 5:
        result = "アルバトロス"

    results.append(result)
print(",".join(results))
