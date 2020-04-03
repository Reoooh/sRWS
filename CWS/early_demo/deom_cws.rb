# 正向最长匹配切分

=begin
filename = ARGV[0]
#file.each_line do |line|
#  puts line
#end
word = "郭德纲"
2.times do |i|
  puts i
  file = File.open(filename)
  file.each_line do |line|
    if "#{word}\n" == line
      puts "yes"
    else
      puts "no"
    end
  end
  file.close
end
=end

# "郭德纲说他喜欢听郭德纲于谦的相声"
# Forward longest matching algorithm
dic_name = ARGV[0]
sentence = ARGV[1]
word_list = []
i = 0
while i<sentence.length
  longest_word = sentence[i]
  (i+1..sentence.length+1).each do |j|
    word = sentence[i..j]
    dictionary = File.open(dic_name)
    dictionary.each_line do |line|
#      p "#{word}\n"
#      p line
      if "#{word}\n" == line
        if word.length>longest_word.length
          longest_word = word
        end
      end
    end
    dictionary.close
  end
  word_list << longest_word
  i += longest_word.length
end
p word_list
p sentence

=begin
dic = ["红宝石","是","世界","最好","语言"]
exa = "红宝石是世界上最好的语言"
puts exa
list = []
i = 0
while i<exa.length
  longest = exa[i]
  (i+1..exa.length+1).each do |j|
    word = exa[i..j]
    dic.each do |line|
      if word == line
        if word.length>longest.length
          longest = word
        end
      end
    end
  end
  list << longest
  i += longest.length
end
p list
=end