# 配列で値を受け取る。
inputs = readlines
puts inputs.length

# 最初の18個を規定打数、それ以降をプレイヤー打数として分割

regulations = inputs[0].split(',').map(&:to_i)
achievements = inputs[1].split(',').map(&:to_i)

scores = regulations.map.with_index do |x, i|
  # 規定打数 - 実績
  achievement = achievements[i]
  score = achievement - x
  if achievement == 1 then x == 5 ? 'コンドル' : 'ホールインワン'
  elsif score == -3 && x == 5 then 'アルバトロス'
  elsif score == -2 then 'イーグル'
  elsif score == -1 then 'バーディ'
  elsif score.zero? then 'パー'
  elsif score >= 1 then score >= 2 ? "#{score}ボギー" : 'ボギー'
  end
end

puts scores.join(',')
