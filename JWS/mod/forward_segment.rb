def forward_segment(text, dic)

  word_list = Array.new
  #p word_list

  alphabet = text.split('')
  # p alphabet

  len = IO.readlines(dic).length
  # puts "capacity of DIC: #{len}"

  i = 0

  while i < alphabet.length
    longest_word = alphabet[i]
    # p longest_word
    (i+1..alphabet.length-1).each do |j|
      word = String.new
      (i..j).each do |k|
        word += alphabet[k]
      end
      # p word
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

  word_list

end
