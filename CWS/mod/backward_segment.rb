# test = "研究生命起源"
#test = "项目的研究"
#dic = "dic/Hanlp_CoreNatureDictionary_mini.txt"

def backward_segment(text, dic)

  word_list = Array.new
  # p word_list

  alphabet = text.split('')
  # p alphabet

  io = File.open(dic)
  n = 0
  io.each_line do
    n += 1
  end
  io.close
  # puts n

  i = alphabet.length - 1

  while i >= 0
    longest_word = alphabet[i]
    # p longest_word
    (0..i-1).each do |j|
      word = String.new
      (j..i).each do |k|
        word += alphabet[k]
      end
      # p word
      File.open(dic) do |full|
        full.each do |all|
          if /^#{word}\t/ =~ all
            if word.length > longest_word.length
              longest_word = word
              break
            end
          end
        end
      end
    end
    word_list << longest_word
    i -= longest_word.length
  end

  word_list.reverse!
    # p word_list
  word_list

end

# backward_segment(test, dic)
