=begin
io = File.open("dic/Hanlp_CoreNatureDictionary_mini.txt")
n = 0
io.each_line do
  n += 1
end
io.close
puts n

p Dir.pwd
Dir.chdir("dic")
p Dir.pwd
=end

#test = "就读北京大学"
#test = "研究生命起源"
#dic = "dic/Hanlp_CoreNatureDictionary_mini.txt"

def forward_segment(text, dic)

  word_list = Array.new
  p word_list

  alphabet = text.split('')
  p alphabet

  io = File.open(dic)
  n = 0
  io.each_line do
    n += 1
  end
  io.close
  puts n

  i = 0

  while i < alphabet.length
    longest_word = alphabet[i]
    p longest_word
    (i+1..alphabet.length-1).each do |j|
      word = String.new
      (i..j).each do |k|
        word += alphabet[k]
      end
      p word
      File.open(dic) do |full|
        full.each do |all|
          if /^#{word}\t/ =~ all
            if word.length > longest_word.length
              longest_word = word
            end
          end
        end
      end
    end
    word_list << longest_word
    i += longest_word.length
  end

  p word_list

end

#forward_segment(test, dic)
