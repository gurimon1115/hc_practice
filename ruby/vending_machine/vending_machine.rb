require_relative 'juice'
require_relative 'suica'

# VendingMachineクラスの定義
class VendingMachine
  attr_reader :sell_amt

  def initialize
    @products = []
    5.times do
      @products << Juice.new('ペプシ', 150)
      @products << Juice.new('モンスター', 230)
      @products << Juice.new('いろはす', 120)
    end

    # 売上
    @sell_amt = 0
  end

  # 飲み物購入
  def buy(name, suica)
    err_msg = can_buy_check(name, suica)
    raise err_msg unless err_msg == ''

    idx = @products.index { |val| val.name == name }

    @sell_amt += @products[idx].price
    suica.pay(@products[idx].price)
    @products.delete_at(idx)
  end

  # 在庫リスト
  def stock_list
    ret_list(:stock)
  end

  # 購入可能リスト
  def can_buy_list
    ret_list(:can_buy)
  end

  # 在庫補充
  def restock_drink(name, price, qty)
    qty.times do
      @products << Juice.new(name, price)
    end
  end

  private

  def ret_list(param)
    drinks = @products.map(&:name).uniq
    list = []
    if param == :stock
      drinks.each do |drink|
        qty = @products.select { |n| n.name == drink }.count
        list << "#{drink} : #{qty}本"
      end
    elsif param == :can_buy
      list = drinks
    end
    list.join(',')
  end

  def can_buy_check(name, suica)
    err_list = []
    err_list << '在庫がないため購入できません。' unless @products.map(&:name).uniq.include?(name)

    @products.each do |item|
      err_list << '残高が足りないため購入できません。' if item.name == name && item.price > suica.amt
    end
    err_list.join('\\n')
  end
end
