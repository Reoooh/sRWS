#require_relative 'Hello'
require_relative 'verb_trans'

dic = "test_dic"

len = IO.readlines(dic)
p len[0]
p len.length

=begin
File.open(dic, "r") do |dict|
  dict.each_line do |line|
    p line
  end
end
=end
=begin
File.open("a_dic", "w") do
  text = File.read("test_dic")
  text.each_line do |line|
    puts line.chomp!
    File.write("a_dic", line)
  end
end
=end
=begin
f = File.new("a_dic", "w")
text = File.read("test_dic")
text.each_line do |line|
  f.puts line.chomp!
end
f.close

puts File.read("a_dic")
=end
=begin
IO.foreach(dic) do |line|
  p line
  fil = File.open("a_dic", "w")
  fil.write(line)
  fil.close
end
=end
=begin
p Random.rand(1..10)


fil_a = File.open("verb/a_dic", "w")
IO.foreach(dic) do |line|
  if line[0]!="#"
    fil_a.write(line)
  end
end
fil_a.close

File.open("verb/a_dic", "r") do |dica|
  dica.each_line do |line|
    p line
  end
end

def plus(line)
  line.chop+"plus\n"+line.chop+"+++\n"
end

fil_b = File.open("verb/b_dic", "w+")
IO.foreach(dic) do |line|
  new_line = plus(line)
  fil_b.write(new_line)
end
fil_b.close
=end
p Random.rand


fil_c = File.open("verb/c_dic", "w+")
IO.foreach(dic) do |line|
  if line[0]!="#"
    line.split("「")[2].chop.split(".").each do |spos|
      case spos
      when "他動１", "他動２", "他動３", "自動１", "自動２", "自動３", "自他動１", "自他動２", "自他動３"
        puts "v"
#      puts "#{masu(line, spos)}"

        neo = jisho(line, spos)
        puts neo
        fil_c.write(neo)

        neo = masu(line, spos)
        puts neo
        fil_c.write(neo)

        neo = te_ta(line, spos)
        puts neo
        fil_c.write(neo)

        neo = nai(line, spos)
        puts neo
        fil_c.write(neo)

        neo = ukeimi(line, spos)
        puts neo
        fil_c.write(neo)

        neo = shieki(line, spos)
        puts neo
        fil_c.write(neo)

        neo = shieki_ukemi(line, spos)
        puts neo
        fil_c.write(neo)

        neo = meirei(line, spos)
        puts neo
        fil_c.write(neo)

        neo = katei(line, spos)
        puts neo
        fil_c.write(neo)

        neo = kanou(line, spos)
        puts neo
        fil_c.write(neo)

        neo = ishi(line, spos)
        puts neo
        fil_c.write(neo)

      when "イ形", "ナ形"
        puts "adj"
        neoadj = keishou(line, spos)
        puts neoadj
        fil_c.write(neoadj)
      when "名"
        puts "n"
#      puts "#{mei(line, spos)}"
        neon = mei(line, spos)
        puts neon
        fil_c.write(neon)
      else
        puts "unknow:#{spos}"
        neo = origin(line, spos)
        puts neo
        fil_c.write(neo)
      end
    end
  end
end
fil_c.close
