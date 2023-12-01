require 'optparse'
require 'date'

date = Date.today
year = date.year

# 引数-mとintの引数を受付ける
value = date.month
opt = OptionParser.new
opt.on('-m int') { |v| value = v.to_i }
opt.parse!(ARGV)

raise "#{value} is neither a month number (1..12) nor a name" unless value.between?(1, 12)

first_day = Date.new(year, value)
last_day = Date.new(year, value, -1)

days = %w[月 火 水 木 金 土 日]

# 年月、月〜日を表示
puts "      #{first_day.strftime('%m')}月 #{year}"
puts days.join(' ')

# 日付ごとの処理
text = ''
(first_day..last_day).each do |dd|
  # 月初の曜日に合わせてインデントする
  text = '   ' * (dd.wday - 1) if dd.day == 1 && dd.wday != 0
  # 数字が1桁か2桁に合わせてインデントする
  text += dd.mday.to_s.rjust(2)
  # 日曜なら改行する
  text += dd.wday.zero? ? "\n" : ' '
end

puts text
