require_relative 'Transform/trans_method'

dic = "failess_JD"

len = IO.readlines(dic)
p len.length

fil_a = File.open("1th/jd_a", "w+")
fil_b = File.open("2nd/jd_b", "w+")
fil_c = File.open("3rd/jd_c", "w+")
IO.foreach(dic) do |line|
  if line[0]!="#"
    line.split("「")[2].chop.split(".").each do |spos|
      case spos
      when "他動１", "他動２", "他動３", "自動１", "自動２", "自動３", "自他動１", "自他動２", "自他動３"
        puts "1th:v"

        neov = jisho(line, spos)
        puts neov
        fil_a.write(neov)

        neov = masu(line, spos)
        puts neov
        fil_a.write(neov)

        neov = te_ta(line, spos)
        puts neov
        fil_a.write(neov)

        neov = nai(line, spos)
        puts neov
        fil_a.write(neov)

        neov = ukeimi(line, spos)
        puts neov
        fil_a.write(neov)

        neov = shieki(line, spos)
        puts neov
        fil_a.write(neov)

        neov = shieki_ukemi(line, spos)
        puts neov
        fil_a.write(neov)

        neov = meirei(line, spos)
        puts neov
        fil_a.write(neov)

        neov = katei(line, spos)
        puts neov
        fil_a.write(neov)

        neov = kanou(line, spos)
        puts neov
        fil_a.write(neov)

        neov = ishi(line, spos)
        puts neov
        fil_a.write(neov)
      when "イ形", "ナ形"
        puts "1th:adj"
        neoadj = keishou(line, spos)
        puts neoadj
        fil_a.write(neoadj)
      when "名"
        puts "2nd:n"
        neon = mei(line, spos)
        puts neon
        fil_b.write(neon)
      when "副", "代", "嘆"
        puts "2nd:#{spos}"
        neo = origin(line, spos)
        puts neo
        fil_b.write(neo)
      else
        puts "3rd:#{spos}"
        neo = origin(line, spos)
        puts neo
        fil_c.write(neo)
      end
    end
  end
end
fil_a.close
fil_b.close
fil_c.close
