p Dir.pwd

loc = "Hanlp_CoreNatureDictionary_mini.txt"

File.open(loc) do |dic|
  n = 1
  dic.each_line do |line|
    p line unless n>35
    n += 1
  end
end

line = "一一列举\tl\t1\n"
puts line
str = "一一列举"
puts "ture" if /^#{str}\t/ =~ line

File.open(loc) do |full|
  str = "商品"
  full.each do |all|
    puts "ture" if /^#{str}\t/ =~ all
  end
end
