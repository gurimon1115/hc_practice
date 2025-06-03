from suica import Suica
from vending_machine import VendingMachine

# ステップ 1
my_suica = Suica()
# step1-1.預かり金(デポジット)として 500 円がデフォルトでチャージされているものとする
print(f"step1-1.{my_suica.deposit}")

# step1-2.Suica には 100 円以上の任意の金額をチャージできる
my_suica.charge(300)
print(f"step1-2.{my_suica.deposit}")

# step1-3.100 円未満をチャージしようとした場合は例外を発生させる
# (以降のテストができないため確認できたらコメントアウトする)
# my_suica.charge(90)

# step1-4.Suica は現在のチャージ残高を取得できる
print(f"step1-4.{my_suica.deposit}")


# ステップ 2
machine = VendingMachine()
# 自動販売機はジュースを１種類格納できる
# ジュースは名前と値段の情報をもつ
# 初期状態で、ペプシ(150 円)を 5 本格納している。
# 自動販売機は在庫を取得できる
print(f"step2.{machine.get_stock_info('stock')}")

# ステップ 3 　購入処理
# step3-1.自動販売機はペプシが購入できるかどうかを取得できる。
print(f"step3-1.{machine.get_stock_info("can_buy")}")

# ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする
machine.buy(my_suica, "ペプシ")

# step3-2.自動販売機はジュースの在庫を減らす
print(f"step3-2.{machine.get_stock_info('stock')}")

# step3-3.売り上げ金額を増やす
print(f"step3-3.{machine.amount}")

# step3-4.Suica のチャージ残高を減らす
print(f"step3-4.{my_suica.deposit}")

# step3-5.チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる
# # (以降のテストができないため確認できたらコメントアウトする)
# machine.buy(my_suica, "ペプシ")
# machine.buy(my_suica, "ペプシ")
# machine.buy(my_suica, "ペプシ")
# machine.buy(my_suica, "ペプシ")
# machine.buy(my_suica, "ペプシ")
# step3-6.自動販売機は現在の売上金額を取得できる
print(f"step3-6.{machine.amount}")

# ステップ 4 　機能拡張
# step4-1.自動販売機に在庫を補充できるようにする
print(f"before step4-1.{machine.get_stock_info('stock')}")
machine.refill("モンスター", 230)
print(f"step4-1.{machine.get_stock_info('stock')}")
# step4-2.ステップ 3 と同様の方法でモンスターといろはすを購入できる
machine.buy(my_suica, "モンスター")
machine.buy(my_suica, "いろはす")
print(f"step4-2.{machine.get_stock_info('stock')}")
