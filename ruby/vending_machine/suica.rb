# Suicaクラスの定義
class Suica
  attr_reader :amt

  def initialize
    @amt = 500
  end

  # チャージメソッド
  def charge(charge_amt)
    raise '100円未満はチャージできません。' if charge_amt < 100

    @amt += charge_amt
  end

  # 支払いメソッド
  def pay(price)
    raise '残高が不足しています。' if price > @amt

    @amt -= price
  end
end
