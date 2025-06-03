from drink import Drink
from suica import Suica


class VendingMachine:
    def __init__(self):
        self._stocks = []
        for _ in range(5):
            self._stocks.append(Drink("ペプシ", 150))
            self._stocks.append(Drink("モンスター", 230))
            self._stocks.append(Drink("いろはす", 120))
        self._amount = 0

    @property
    def amount(self):
        return self._amount

    def get_stock_info(self, info_style):
        """
        ストックが1本以上ある購入可能なドリンク情報または本数まで含んだストックの情報を返す

        Args:
          info_style (str): 情報の種別 'stock'または'can_buy'

        Raises:
          ValueError: 金額が100円以下の場合に発生
        """
        drink_list = []
        stock_set = set([drink.name for drink in self._stocks])

        if info_style == "stock":
            for drink_name in stock_set:
                qty = len([drink for drink in self._stocks if drink.name == drink_name])
                drink_list.append(f"{drink_name} : {qty}本")
        elif info_style == "can_buy":
            drink_list = list(stock_set)
        return ", ".join(drink_list)

    def buy(self, suica, drink_name):
        # 購入可能かのチェック
        self.can_buy_check(suica, drink_name)

        stock_idx = [stock.name for stock in self._stocks].index(drink_name)
        price = self._stocks[stock_idx].price

        suica.pay(price)
        self._amount += price
        del self._stocks[stock_idx]

    def can_buy_check(self, suica, drink_name):
        """
        ドリンクが購入可能かチェックする。
          在庫が存在するか
          残金不足でないか

        Args:
          suica (instance): Suicaクラスのインスタンス
          drink_name (str): 購入するdrinkの名称

        Raises:
          Exception: 在庫不足の場合または残金不足の場合に発生
        """
        buy_drink_info = next(
            (stock for stock in self._stocks if stock.name == drink_name), None
        )

        if buy_drink_info is None:
            raise Exception("在庫がないため購入できません。")

        if suica.deposit < buy_drink_info.price:
            raise Exception("残金不足のため購入できません。")

    def refill(self, name, price):
        """
        self._stocksにdrinkを追加する

        Args:
          name (str): 追加するdrinkの名称

          price (sint): 追加するdrinkの金額

        Raises:
        """
        self._stocks.append(Drink(name, price))


if __name__ == "__main__":
    my_machine = VendingMachine()
    abc = my_machine.get_stock()
    print(abc)
