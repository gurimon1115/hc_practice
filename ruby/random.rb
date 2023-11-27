members = %w[A B C D E F]
pattern = %w[3-3 2-4]

members.shuffle!
if pattern.sample == '3-3'
  p members[0, 3].sort
  p members[3, 6].sort
else
  p members[0, 2].sort
  p members[2, 6].sort
end
