require 'optparse'
require 'date'

date = Date.today

# 引数-mとintの引数を受付ける
value = date.month
opt = OptionParser.new
opt.on('-m int') { |v| value = v.to_i }
opt.parse!(ARGV)

raise "#{value} is neither a month number (1..12) nor a name" unless value.between?(1, 12)

first_day = Date.new(date.year, value)
last_day = Date.new(date.year, value, -1)

days = %w[月 火 水 木 金 土 日]
month_start_day = first_day.wday - 1

# 月初から月末の日付オブジェクトを取得する
dates = []
(first_day..last_day).each do |d|
  dates << d
end

# 年月、月〜日を表示
puts "      #{first_day.strftime('%m')}月 #{date.year}"
puts days.join(' ')

# 日付ごとの処理
idx = 0
text = ''
dates.each do |dd|
  # 月初の曜日に合わせてインデントする
  text = '   ' * month_start_day if idx.zero? && month_start_day >= 1
  # 数字が1桁か2桁に合わせてインデントする
  text += if dd.mday.to_s.length == 2
            "#{dd.mday} "
          else
            " #{dd.mday} "
          end
  # 日曜なら改行する
  text += "\n" if dd.wday.zero?
  idx += 1
end

puts text
