# test = "商品和服务"
test = "就读北京大学"
dic = "dic/Hanlp_CoreNatureDictionary_mini.txt"

def fully_segment(text, dic)

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

  (0..(alphabet.length - 1)).each do |i|
    (i..(alphabet.length - 1)).each do |j|
      word = String.new
      (i..j).each do |k|
        word += alphabet[k]
      end
      p word
      File.open(dic) do |full|
        full.each do |all|
          word_list << word if /^#{word}\t/ =~ all
        end
      end
    end
  end

  p word_list

end

fully_segment(test, dic)