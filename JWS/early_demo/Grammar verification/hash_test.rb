a = Hash.new

b = %w(a b c d)

b.each do |n|
  p n
  p b.index(n)
  a[b.index(n)] = n
end

p a
c = {3=>"d", 1=>"b", 2=>"c", 0=>"a"}
d = c.sort
p d[0][1]