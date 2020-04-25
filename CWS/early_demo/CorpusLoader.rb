dic = "simple_corpus"

File.open(dic) do |dic|
  dic.each_line do |line|
    p line
  end
end