class Suica:
    def __init__(self):
        self._deposit = 500

    @property
    def deposit(self):
        return self._deposit

    def charge(self, amt):
        """
        指定された金額を残高にチャージする

        Args:
          amt (int): チャージする金額

        Raises:
          ValueError: 金額が100円以下の場合に発生
        """
        if amt < 100:
            raise ValueError("100円未満のチャージ不可")
        self._deposit += amt

    def pay(self, price):
        """
        受け取った金額を残高から減産する

        Args:
          price (int): 減算する金額

        Raises:
        """
        self._deposit -= price


if __name__ == "__main__":
    my_suica = Suica()
    my_suica.charge(500)
    print(my_suica.deposit)
