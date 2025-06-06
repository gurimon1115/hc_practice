class Pokemon:
    def __init__(self, name, type1, type2, hp):
        self._name = name
        self._type1 = type1
        self._type2 = type2
        self._hp = hp

    def attack(self):
        print(f"{self._name}の攻撃!!!")

    def change_name(self, newName):
        if "F Word" in newName:
            print(f"{newName}は名前に使用できません。")
            return
        self._name = newName

    @property
    def name(self):
        return self._name


class Pikachu(Pokemon):
    def attack(self):
        super().attack()
        print(f"{self._name}の10万ボルト!!!")


class Zenigame(Pokemon):
    def attack(self):
        super().attack()
        print(f"{self._name}の水鉄砲!!!")


if __name__ == "__main__":
    pikachu = Pikachu("ピカチュウ", "electric", "", 10)
    pikachu.attack()
    pikachu.change_name("F Word ピカチュウ")
    print(pikachu.name)

    zenigame = Zenigame("ゼニガメ", "water", "", 30)
    zenigame.attack()
    zenigame.change_name("カメール")
    print(zenigame.name)
