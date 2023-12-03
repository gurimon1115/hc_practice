# 配列で値を受け取る。
inputs = readlines
puts inputs.length

# 最初の18個を規定打数、それ以降をプレイヤー打数として分割

regulations = inputs[0].split(',').map(&:to_i)
achievements = inputs[1].split(',').map(&:to_i)

SCORE_MAPPING = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0 => 'パー',
  1 => 'ボギ-'
}

scores = regulations.map.with_index do |x, i|
  # 規定打数 - 実績
  achievement = achievements[i]
  score = achievement - x

  if achievement == 1 && score != -4 then 'ホールインワン'
  elsif score >= 2 then "#{score}ボギー"
  else
    SCORE_MAPPING[score]
  end
end

puts scores.join(',')
