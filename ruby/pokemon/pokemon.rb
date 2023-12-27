# Pokemonクラスの定義
class Pokemon
  attr_reader :name

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def change_name(new_name)
    return "#{new_name} は名前に使用できません。" if new_name == '***'

    @name = new_name
  end

  def attack
    puts "#{@name} のこうげき！"
  end
end

# ピカチュウクラスの定義
class Pikachu < Pokemon
  def attack
    super
    puts "#{@name} の10万ボルト!"
  end
end

# ゼニガメクラスの定義
class Zenigame < Pokemon
  def attack
    super
    puts "#{@name} のみずてっぽう!"
  end
end
