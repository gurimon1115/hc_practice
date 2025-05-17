import random

group_list = ["A", "B", "C", "D", "E", "F"]
divide_pattern = [2, 3]

group1 = random.sample(group_list, random.choice(divide_pattern))
group2 = list(set(group_list) - set(group1))

# group1,group2の代入時点でsorted()でチェーンすると読みづらいためsortedの変数を設ける
sorted_group1 = sorted(group1)
sorted_group2 = sorted(group2)

print(sorted_group1)
print(sorted_group2)
