require_relative './suica'
require_relative './vending_machine'

suica = Suica.new
machine = VendingMachine.new

# デポジットがチャージされていること
puts suica.amt

# 100円以上の任意の金額がチャージできること
# Suicanの現在のチャージ残高を取得できること
suica.charge(100)
puts suica.amt

# 100円未満のチャージは例外を発生させること
# ここで例外が発生する。確認後コメントアウトする。
suica.charge(1)

# 自動販売機は在庫を取得できること
puts machine.stock_list
# 自動販売機は購入可能なドリンクのリストを取得できること
puts machine.can_buy_list

# 飲み物購入
# 自動販売機はジュースの在庫を減らすこと
machine.buy('ペプシ', suica)
puts machine.stock_list

# 自動販売機の売上金額が増えていること
puts machine.sell_amt
# Suicaのチャージ残高が減っていること
puts suica.amt

# 購入時Suicaの残高不足はエラーとなること
machine.buy('ペプシ', suica)
machine.buy('ペプシ', suica)
machine.buy('ペプシ', suica)
puts suica.amt
# ここで例外が発生する。確認後コメントアウトする。
# machine.buy('ペプシ', suica)

# 購入時在庫が不足の場合エラーとなること
suica.charge(1000)
machine.buy('ペプシ', suica)
puts machine.stock_list
# ここで例外が発生する。確認後コメントアウトする。
# machine.buy('ペプシ', suica)

# 自動販売機に在庫を補充することができること
machine.restock_drink('ペプシ', 2)
puts machine.stock_list

# モンスターが購入できること
puts machine.sell_amt
puts suica.amt
machine.buy('モンスター', suica)
# 在庫の確認
puts machine.stock_list
# 売上金額の確認
puts machine.sell_amt
# Suicaの残高確認
puts suica.amt

# いろはすが購入できること
machine.buy('いろはす', suica)
# 在庫の確認
puts machine.stock_list
# 売上金額の確認
puts machine.sell_amt
# Suicaの残高確認
puts suica.amt
