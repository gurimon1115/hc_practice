require_relative 'juice'
require_relative 'suica'

# VendingMachineクラスの定義
class VendingMachine
  attr_reader :sell_amt, :stocks

  def initialize
    @products = []
    @products << Juice.new('ペプシ', 150)
    @products << Juice.new('モンスター', 230)
    @products << Juice.new('いろはす', 120)

    @stocks = {}
    @products.each { |p| @stocks.store(p.name, 5) }

    # 売上
    @sell_amt = 0
  end

  # 飲み物購入
  def buy(name, suica)
    err_msg = can_buy_check(name, suica)
    raise err_msg unless err_msg == ''

    @stocks[name] -= 1
    @products.each do |item|
      if item.name == name
        @sell_amt += item.price
        suica.pay(item.price)
      end
    end
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
  def restock_drink(name, qty)
    @stocks[name] += qty if @stocks.key?(name)
  end

  private

  def ret_list(param)
    list = []
    @stocks.each do |key, val|
      list << if param == :stock then "#{key} #{val}本"
              elsif param == :can_buy && val.positive? then key
              end
    end
    list.join(',')
  end

  def can_buy_check(name, suica)
    err_list = []
    err_list << '在庫がないため購入できません。' unless @stocks[name].positive?

    @products.each do |item|
      err_list << '残高が足りないため購入できません。' if item.name == name && item.price > suica.amt
    end
    err_list.join('\\n')
  end
end
