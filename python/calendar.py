import sys
import datetime


# 現在年月日の取得
dt_now = datetime.datetime.now()

# コマンドライン引数を受け取る
command = ""
input_month = 0

if len(sys.argv) == 3:
    command = sys.argv[1]
    input_month = int(sys.argv[2])

    # 1~12以外のコマンドライン引数を受け取ったときエラーを返す
    if input_month not in range(1, 13):
        raise Exception(
            str(input_month) + " is neither a month number (1..12) nor a name"
        )
else:
    # コマンドライン引数がないとき当月をセットする
    input_month = dt_now.month


# 表示するdatetimeインスタンス作成
first_day = datetime.datetime(dt_now.year, input_month, 1)
first_day_idx = int(first_day.strftime("%w"))

# 最終日を取得する 現在が12月のとき年を+1する
year = dt_now.year
if input_month == 12:
    year += 1
    input_month = 0

last_date = datetime.datetime(dt_now.year, input_month + 1, 1) - datetime.timedelta(
    days=1
)

# 月初の前のインデントをlistに格納
month_of_date = []
if first_day_idx != 0:
    for _ in range(first_day_idx):
        month_of_date.append("  ")

# その月の日を全てlistに格納
idx = 1
for _ in range(last_date.day):
    month_of_date.append(str(idx).rjust(2))
    idx += 1

# 1週間ごとに改行を入れて整形する
text = ""
for i, date in enumerate(month_of_date):
    if i % 7 == 0:
        text += "\n"
    text += date + " "

# 年月のヘッダーを出力する
print(f"      {first_day.month}月 {first_day.year}")
# 曜日を出力する
print("日 月 火 水 木 金 土", end="")
# 日付の出力
print(text)
