# tes = "初めまして、私はルビーのファンです。"
tes = "私はルビーのファンです"

alphabet = tes.split('')
p alphabet

filename = "ws_jpDy"
file = File.open(filename)
file.each_line do |line|
  line = line.chomp
  line = line.split('][')
  line[0].delete!("[")
  line[-1].delete!("]")
  p line
end
file.close

(0..(alphabet.length - 1)).each do |i|
  (i..(alphabet.length - 1)).each do |j|
    word = String.new
    (i..j).each do |k|
      word += alphabet[k]
    end
    p word
  end
end
