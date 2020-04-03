dic = "dic/Japanese_Dictionary"

len = IO.readlines(dic)
p len.length
=begin
fil = File.open("a_dic", "w")
IO.foreach(dic) do |line|
  fil.write(line)
end
fil.close

File.open("a_dic", "r") do |dic2|
  dic2.each_line do |line|
    p line
  end
end
=end