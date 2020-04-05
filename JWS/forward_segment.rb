=begin
test = "日曜と祝日がダブる"
dic_a = "dic/1th/jd_a"
dic_b = "dic/2nd/jd_b"
dic_c = "dic/3rd/jd_c"

def forward_segment(text, dic_a, dic_b, dic_c)

  word_list_a = Array.new
  word_list_h = Hash.new

  alphabet = text.split('')
  p alphabet

  len_a = IO.readlines(dic_a).length
  len_b = IO.readlines(dic_b).length
  len_c = IO.readlines(dic_c).length
  puts "dic 1th:#{len_a} 2nd:#{len_b} 3rd:#{len_c}"

  i_a = 0
  while i_a < alphabet.length
    longest_word = alphabet[i_a]
    p longest_word
    (i_a+1..alphabet.length-1).each do |j|
      word = String.new
      (i_a..j).each do |k|
        word += alphabet[k]
      end
      p word
      File.open(dic_a) do |full|
        full.each do |all|
          if /^\[#{word}\]/ =~ all
            if word.length > longest_word.length
              longest_word = word
            end
          end
        end
      end
    end
#    word_list_a << longest_word
    if longest_word.length>1
      word_list_h[i_a] = longest_word
      (i_a..i_a+longest_word.length-1).each do |n|
        alphabet[n] = ""
      end
    end
    i_a += longest_word.length
    p alphabet
  end

  i_b = 0
  while i_b < alphabet.length
    longest_word = alphabet[i_b]
    p longest_word
    (i_b+1..alphabet.length-1).each do |j|
      word = String.new
      (i_b..j).each do |k|
        word += alphabet[k]
      end
      p word
      File.open(dic_b) do |full|
        full.each do |all|
          if /^\[#{word}\]/ =~ all
            if word.length > longest_word.length
              longest_word = word
            end
          end
        end
      end
    end
#    word_list_a << longest_word
    if longest_word.length>1
      word_list_h[i_a] = longest_word
      (i_b..i_b+longest_word.length-1).each do |n|
        alphabet[n] = ""
      end
    end
    i_b += longest_word.length
    p alphabet
  end

  i_c = 0
  while i_c < alphabet.length
    longest_word = alphabet[i_c]
    p longest_word
    (i_c+1..alphabet.length-1).each do |j|
      word = String.new
      (i_c..j).each do |k|
        word += alphabet[k]
      end
      p word
      File.open(dic_c) do |full|
        full.each do |all|
          if /^\[#{word}\]/ =~ all
            if word.length > longest_word.length
              longest_word = word
            end
          end
        end
      end
    end
    word_list_a << longest_word
    word_list_h[i_c] = longest_word
    (i_c..i_c+longest_word.length-1).each do |n|
      alphabet[n] = ""
    end
    i += longest_word.length
    p alphabet
  end

  p alphabet
  p word_list_a
  p word_list_h

end

forward_segment(test, dic_a, dic_b, dic_c)
=end

test = "日曜と祝日がダブる"
dic = "dic/full_JD"

def forward_segment(text, dic)

  word_list = Array.new
  #p word_list

  alphabet = text.split('')
  p alphabet

  len = IO.readlines(dic).length
  puts len

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
          if /^\[#{word}\]/ =~ all
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

forward_segment(test, dic)