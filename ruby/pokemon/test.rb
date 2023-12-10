require_relative 'pokemon'

pikachu = Pikachu.new('ピカチュウ', '電気', '', '10')
zenigame = Zenigame.new('ゼニガメ', '水', '', '4')

pikachu.attack
zenigame.attack

pikachu.change_name('ピチュー')
puts pikachu.name

zenigame.change_name('***')
puts zenigame.name
