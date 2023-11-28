members = %w[A B C D E F]
pattern = [2, 3].sample

group1 = members.sample(pattern).sort
group2 = members - group1

p group1
p group2
