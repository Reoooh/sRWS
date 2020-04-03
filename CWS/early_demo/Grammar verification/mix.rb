puts "hello"

# Here Document
10.times do |i|
  print(<<"EOB")
i: #{i}
EOB
end

puts "I love ruby"

=begin
text = "就读北京大学"
alphabet = text.split('')
p alphabet
i = 0
while i < alphabet.length
  p i
  lon = alphabet[i]
  p lon
  (i+1..alphabet.length-1).each do |j|
    lon = alphabet[i..j]
    p lon
  end
  i += 1
end
=end

dic = ["红宝石","世界","最好的","语言"]
exa = "红宝石是世界上最好的语言"
puts exa
list = []
i = 0
while i<exa.length
  longest = exa[i]
  (i+1..exa.length-1).each do |j|
    word = exa[i..j]
    p word
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