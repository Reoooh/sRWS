$gojyuuon = {う: %w(わ い え お), く: %w(か き け こ), ぐ: %w(が ぎ げ ご), す: %w(さ し せ そ), つ: %w(た ち て と), ぬ: %w(な に ね の), ぶ: %w(ば び べ ぼ), む: %w(ま み め も), る: %w(ら り れ ろ)}

def origin(line, spos)

  origin_a = line.split("「")[0]
  origin_b = line.split("「")[1].chop

  if /[a-zA-Z]/ =~ origin_b || origin_b.empty?
    if origin_a[0]=="~"
      oa = origin_a.split("")
      oa.shift
      oaa = oa.join
    elsif origin_a[-1]=="~"
      oa = origin_a.split("")
      oa.pop
      oaa = oa.join
    else
      oaa = origin_a
    end
    "["+oaa+"]["+spos+"]\n"
  else
    if origin_a[0]=="~"
      oa = origin_a.split("")
      oa.shift
      oaa = oa.join
    elsif origin_a[-1]=="~"
      oa = origin_a.split("")
      oa.pop
      oaa = oa.join
    else
      oaa = origin_a
    end
    "["+oaa+"]["+spos+"]\n" +
        "["+origin_b+"]["+spos+"]\n"
  end
end

#mei:名词
def mei(line, spos)
  meishi_a = line.split("「")[0]
  meishi_b = line.split("「")[1].chop
  if /[a-zA-Z]/ =~ meishi_b || meishi_b.empty?
    "["+meishi_a+"]["+spos+"]\n"
  else
    "["+meishi_a+"]["+spos+"]\n" + "["+meishi_b+"]["+spos+"]\n"
  end
end

#jisho:辞书形
def jisho(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"
    if jishokei_b.empty?
      "["+jishokei_a+"]["+spos+"][辞書形]\n"
    else
      "["+jishokei_a+"]["+spos+"][辞書形]\n" +
          "["+jishokei_b+"]["+spos+"][辞書形]\n"
    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?
      "["+jishokei_a+"]["+spos+"][辞書形]\n"
    else
      "["+jishokei_a+"]["+spos+"][辞書形]\n" +
          "["+jishokei_b+"]["+spos+"][辞書形]\n"
    end
  else
    if jishokei_a == "来る"
      "["+jishokei_a+"]["+spos+"][辞書形]\n" + "["+jishokei_b+"]["+spos+"][辞書形]\n"
    elsif /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
      if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
        2.times do
          jishokei_a.chop!
        end
        jishokei_a = jishokei_a+"する"
      else
        jishokei_a = jishokei_a+"する"
      end
      "["+jishokei_a+"]["+spos+"][辞書形]\n"
    else
      if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
        2.times do
          jishokei_a.chop!
          jishokei_b.chop!
        end
        jishokei_a = jishokei_a+"する"
        jishokei_b = jishokei_b+"する"
      else
        jishokei_a = jishokei_a+"する"
        jishokei_b = jishokei_b+"する"
      end
      "["+jishokei_a+"]["+spos+"][辞書形]\n" +
          "["+jishokei_b+"]["+spos+"][辞書形]\n"
    end
  end
end

#masu:ます形
def masu(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"
    if jishokei_b.empty?
      masukei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ます"
      masukei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ません"
      masukei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ました"
      masukei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ませんでした"

      "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
    else
      masukei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ます"
      kana_masukei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][1]+"ます"
      masukei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ません"
      kana_masukei_nai = jishokei_b.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ません"
      masukei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ました"
      kana_masukei_ta = jishokei_b.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ました"
      masukei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ませんでした"
      kana_masukei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_a[-1].to_sym][1]+"ませんでした"

      "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+kana_masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+kana_masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+kana_masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n" +
          "["+kana_masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?
      masukei = jishokei_a.chop+"ます"
      masukei_nai = jishokei_a.chop+"ません"
      masukei_ta = jishokei_a.chop+"ました"
      masukei_nai_ta = jishokei_a.chop+"ませんでした"

      "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
    else
      masukei = jishokei_a.chop+"ます"
      kana_masukei = jishokei_b.chop+"ます"
      masukei_nai = jishokei_a.chop+"ません"
      kana_masukei_nai = jishokei_b.chop+"ません"
      masukei_ta = jishokei_a.chop+"ました"
      kana_masukei_ta = jishokei_b.chop+"ました"
      masukei_nai_ta = jishokei_a.chop+"ませんでした"
      kana_masukei_nai_ta = jishokei_b.chop+"ませんでした"

      "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+kana_masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+kana_masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+kana_masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n" +
          "["+kana_masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
    end
  else
    if jishokei_a=="来る"
      masukei = "来ます"
      kana_masukei = "きます"
      masukei_nai = "来ません"
      kana_masukei_nai = "きません"
      masukei_ta = "来ました"
      kana_masukei_ta = "きました"
      masukei_nai_ta = "来ませんでした"
      kana_masukei_nai_ta = "きませんでした"

      "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+kana_masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
          "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+kana_masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
          "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+kana_masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
          "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n" +
          "["+kana_masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          masukei = jishokei_a+"します"
          masukei_nai = jishokei_a+"しません"
          masukei_ta = jishokei_a+"しました"
          masukei_nai_ta = jishokei_a+"しませんでした"
        else
          masukei = jishokei_a+"します"
          masukei_nai = jishokei_a+"しません"
          masukei_ta = jishokei_a+"しました"
          masukei_nai_ta = jishokei_a+"しませんでした"
        end
        "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
            "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
            "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
            "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          masukei = jishokei_a+"します"
          kana_masukei = jishokei_b+"します"
          masukei_nai = jishokei_a+"しません"
          kana_masukei_nai = jishokei_b+"しません"
          masukei_ta = jishokei_a+"しました"
          kana_masukei_ta = jishokei_b+"しました"
          masukei_nai_ta = jishokei_a+"しませんでした"
          kana_masukei_nai_ta = jishokei_b+"しませんでした"
        else
          masukei = jishokei_a+"します"
          kana_masukei = jishokei_b+"します"
          masukei_nai = jishokei_a+"しません"
          kana_masukei_nai = jishokei_b+"しません"
          masukei_ta = jishokei_a+"しました"
          kana_masukei_ta = jishokei_b+"しました"
          masukei_nai_ta = jishokei_a+"しませんでした"
          kana_masukei_nai_ta = jishokei_b+"しませんでした"
        end
        "["+masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
            "["+kana_masukei+"]["+spos+"][ます形][现在时肯定形]\n" +
            "["+masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
            "["+kana_masukei_nai+"]["+spos+"][ます形][现在时否定形]\n" +
            "["+masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
            "["+kana_masukei_ta+"]["+spos+"][ます形][过去时肯定形]\n" +
            "["+masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n" +
            "["+kana_masukei_nai_ta+"]["+spos+"][ます形][过去时否定形]\n"
      end
    end
  end
end

#te_ta:て形　た形
def te_ta(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"
    #gobi:語尾

    gobi_te = String.new
    gobi_ta = String.new

    case jishokei_a[-1]
    when "く"
      gobi_te = "いて"
      gobi_ta = "いた"
    when "ぐ"
      gobi_te = "いで"
      gobi_ta = "いだ"
    when "う", "つ", "る"
      gobi_te = "って"
      gobi_ta = "った"
    when "ぬ", "ぶ", "む"
      gobi_te = "んで"
      gobi_ta = "んだ"
    when "す"
      gobi_te = "して"
      gobi_ta = "した"
    else
      "#WRONG:te & ta\n"
    end

    if jishokei_a == "行く"
      "[行って][#{spos}][て形]\n" +
          "[いって]["+spos+"][て形]\n" +
          "[行った]["+spos+"][た形]\n" +
          "[いった]["+spos+"][た形]\n"
    elsif jishokei_b.empty?
      tekei = jishokei_a.chop + gobi_te
      takei = jishokei_a.chop + gobi_ta

      "["+tekei+"]["+spos+"][て形]\n" +
          "["+takei+"]["+spos+"][た形]\n"
    else
      tekei = jishokei_a.chop + gobi_te
      kana_tekei = jishokei_b.chop + gobi_te
      takei = jishokei_a.chop + gobi_ta
      kana_takei = jishokei_b.chop + gobi_ta

      "["+tekei+"]["+spos+"][て形]\n" +
          "["+kana_tekei+"]["+spos+"][て形]\n" +
          "["+takei+"]["+spos+"][た形]\n" +
          "["+kana_takei+"]["+spos+"][た形]\n"
    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?
      tekei = jishokei_a.chop + "て"
      takei = jishokei_a.chop + "た"
      "["+tekei+"]["+spos+"][て形]\n" +
          "["+takei+"]["+spos+"][た形]\n"
    else
      tekei = jishokei_a.chop + "て"
      kana_tekei = jishokei_b.chop + "て"
      takei = jishokei_a.chop + "た"
      kana_takei = jishokei_b.chop + "た"

      "["+tekei+"]["+spos+"][て形]\n" +
          "["+kana_tekei+"]["+spos+"][て形]\n" +
          "["+takei+"]["+spos+"][た形]\n" +
          "["+kana_takei+"]["+spos+"][た形]\n"
    end
  else
    if jishokei_a == "来る"
      tekei = "来て"
      kana_tekei = "きて"
      takei = "来た"
      kana_takei = "きた"

      "["+tekei+"]["+spos+"][て形]\n" +
          "["+kana_tekei+"]["+spos+"][て形]\n" +
          "["+takei+"]["+spos+"][た形]\n" +
          "["+kana_takei+"]["+spos+"][た形]\n"
    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          tekei = jishokei_a+"して"
          takei = jishokei_a+"した"
        else
          tekei = jishokei_a+"して"
          takei = jishokei_a+"した"
        end
        "["+tekei+"]["+spos+"][て形]\n" +
            "["+takei+"]["+spos+"][た形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          tekei = jishokei_a+"して"
          kana_tekei = jishokei_b+"して"
          takei = jishokei_a+"した"
          kana_takei = jishokei_b+"した"
        else
          tekei = jishokei_a+"して"
          kana_tekei = jishokei_b+"して"
          takei = jishokei_a+"した"
          kana_takei = jishokei_b+"した"
        end
        "["+tekei+"]["+spos+"][て形]\n" +
            "["+kana_tekei+"]["+spos+"][て形]\n" +
            "["+takei+"]["+spos+"][た形]\n" +
            "["+kana_takei+"]["+spos+"][た形]\n"
      end
    end
  end
end

#nai:未然
def nai(line, spos)
  # naikei:ない形
  # kana_naikei:ない形 片假名
  # naikei_ta:ない形 过去时
  # kana_naikei_ta:ない形 片假名 过去时
  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"
    if jishokei_a == "ある"
      naikei = "ない"
      naikei_ta = "なかった"

      "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
    elsif jishokei_b.empty?
      naikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"ない"
      naikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"なかった"

      "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
    else
      naikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"ない"
      kana_naikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"ない"
      naikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"なかった"
      kana_naikei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"なかった"

      "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+kana_naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n" +
          "["+kana_naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?
      naikei = jishokei_a.chop+"ない"
      naikei_ta = jishokei_a.chop+"なかった"

      "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
    else
      naikei = jishokei_a.chop+"ない"
      kana_naikei = jishokei_b.chop+"ない"
      naikei_ta = jishokei_a.chop+"なかった"
      kana_naikei_ta = jishokei_b.chop+"なかった"

      "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+kana_naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n" +
          "["+kana_naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
    end
  else
    if jishokei_a=="来る"
      naikei = "来ない"
      kana_naikei = "こない"
      naikei_ta = "来なかった"
      kana_naikei_ta = "こなかった"

      "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+kana_naikei+"]["+spos+"][ない形][现在时否定形]\n" +
          "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n" +
          "["+kana_naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          naikei = jishokei_a+"しない"
          naikei_ta = jishokei_a+"しなかった"
        else
          naikei = jishokei_a+"しない"
          naikei_ta = jishokei_a+"しなかった"
        end
        "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
            "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          naikei = jishokei_a+"しない"
          kana_naikei = jishokei_b+"しない"
          naikei_ta = jishokei_a+"しなかった"
          kana_naikei_ta = jishokei_b+"しなかった"
        else
          naikei = jishokei_a+"しない"
          kana_naikei = jishokei_b+"しない"
          naikei_ta = jishokei_a+"しなかった"
          kana_naikei_ta = jishokei_b+"しなかった"
        end
        "["+naikei+"]["+spos+"][ない形][现在时否定形]\n" +
            "["+kana_naikei+"]["+spos+"][ない形][现在时否定形]\n" +
            "["+naikei_ta+"]["+spos+"][ない形][过去时否定形]\n" +
            "["+kana_naikei_ta+"]["+spos+"][ない形][过去时否定形]\n"
      end
    end
  end
end

#ukemi:受身/被动
def ukeimi(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"

    if jishokei_b.empty?
      ukeimikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れる"
      ukeimikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れない"
      ukeimikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れた"
      ukeimikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れなかった"

      "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
    else
      ukeimikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れる"
      kana_ukeimikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れる"
      ukeimikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れない"
      kana_ukeimikei_nai = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れない"
      ukeimikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れた"
      kana_ukeimikei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れた"
      ukeimikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れなかった"
      kana_ukeimikei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れなかった"

      "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+kana_ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+kana_ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+kana_ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n" +
          "["+kana_ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?
      ukeimikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れる"
      ukeimikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れない"
      ukeimikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れた"
      ukeimikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れなかった"

      "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
    else
      ukeimikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れる"
      kana_ukeimikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れる"
      ukeimikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れない"
      kana_ukeimikei_nai = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れない"
      ukeimikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れた"
      kana_ukeimikei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れた"
      ukeimikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"れなかった"
      kana_ukeimikei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"れなかった"

      "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+kana_ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+kana_ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+kana_ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n" +
          "["+kana_ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
    end
  else
    if jishokei_a=="来る"
      ukeimikei = "来られる"
      kana_ukeimikei = "こられる"
      ukeimikei_nai = "来られない"
      kana_ukeimikei_nai = "こられない"
      ukeimikei_ta = "来られた"
      kana_ukeimikei_ta = "こられた"
      ukeimikei_nai_ta = "来られなかった"
      kana_ukeimikei_nai_ta = "こられなかった"

      "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+kana_ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
          "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+kana_ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
          "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+kana_ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
          "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n" +
          "["+kana_ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          ukeimikei = jishokei_a+"される"
          ukeimikei_nai = jishokei_a+"されない"
          ukeimikei_ta = jishokei_a+"された"
          ukeimikei_nai_ta = jishokei_a+"されなかった"
        else
          ukeimikei = jishokei_a+"される"
          ukeimikei_nai = jishokei_a+"されない"
          ukeimikei_ta = jishokei_a+"された"
          ukeimikei_nai_ta = jishokei_a+"されなかった"
        end
        "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
            "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
            "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
            "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          ukeimikei = jishokei_a+"される"
          kana_ukeimikei = jishokei_b+"される"
          ukeimikei_nai = jishokei_a+"されない"
          kana_ukeimikei_nai = jishokei_b+"されない"
          ukeimikei_ta = jishokei_a+"された"
          kana_ukeimikei_ta = jishokei_b+"された"
          ukeimikei_nai_ta = jishokei_a+"されなかった"
          kana_ukeimikei_nai_ta = jishokei_b+"されなかった"
        else
          ukeimikei = jishokei_a+"される"
          kana_ukeimikei = jishokei_b+"される"
          ukeimikei_nai = jishokei_a+"されない"
          kana_ukeimikei_nai = jishokei_b+"されない"
          ukeimikei_ta = jishokei_a+"された"
          kana_ukeimikei_ta = jishokei_b+"された"
          ukeimikei_nai_ta = jishokei_a+"されなかった"
          kana_ukeimikei_nai_ta = jishokei_b+"されなかった"
        end
        "["+ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
            "["+kana_ukeimikei+"]["+spos+"][被动形][现在时肯定形]\n" +
            "["+ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
            "["+kana_ukeimikei_nai+"]["+spos+"][被动形][现在时否定形]\n" +
            "["+ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
            "["+kana_ukeimikei_ta+"]["+spos+"][被动形][过去时肯定形]\n" +
            "["+ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n" +
            "["+kana_ukeimikei_nai_ta+"]["+spos+"][被动形][过去时否定形]\n"
      end
    end
  end
end

#shieki:使役
def shieki(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"

    if jishokei_b.empty?

      shiekikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せる"
      shiekikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せない"
      shiekikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せた"
      shiekikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せなかった"

      "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"
    else
      shiekikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せる"
      kana_shiekikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せる"
      shiekikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せない"
      kana_shiekikei_nai = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せない"
      shiekikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せた"
      kana_shiekikei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せた"
      shiekikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せなかった"
      kana_shiekikei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せなかった"

      "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+kana_shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+kana_shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+kana_shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n" +
          "["+kana_shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"
    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?
      shiekikei = jishokei_a.chop+"させる"
      shiekikei_nai = jishokei_a.chop+"させない"
      shiekikei_ta = jishokei_a.chop+"させた"
      shiekikei_nai_ta = jishokei_a.chop+"させなかった"

      "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"

    else
      shiekikei = jishokei_a.chop+"させる"
      kana_shiekikei = jishokei_b.chop+"させる"
      shiekikei_nai = jishokei_a.chop+"させない"
      kana_shiekikei_nai = jishokei_b.chop+"させない"
      shiekikei_ta = jishokei_a.chop+"させた"
      kana_shiekikei_ta = jishokei_b.chop+"させた"
      shiekikei_nai_ta = jishokei_a.chop+"させなかった"
      kana_shiekikei_nai_ta = jishokei_b.chop+"させなかった"

      "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+kana_shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+kana_shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+kana_shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n" +
          "["+kana_shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"
    end
  else
    if jishokei_a=="来る"

      shiekikei = "来させる"
      kana_shiekikei = "こさせる"
      shiekikei_nai = "来させない"
      kana_shiekikei_nai = "こさせない"
      shiekikei_ta = "来させた"
      kana_shiekikei_ta = "こさせた"
      shiekikei_nai_ta = "来させなかった"
      kana_shiekikei_nai_ta = "こさせなかった"

      "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+kana_shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
          "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+kana_shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
          "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+kana_shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
          "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n" +
          "["+kana_shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"
    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          shiekikei = jishokei_a+"させる"
          shiekikei_nai = jishokei_a+"させない"
          shiekikei_ta = jishokei_a+"させた"
          shiekikei_nai_ta = jishokei_a+"させなかった"
        else
          shiekikei = jishokei_a+"させる"
          shiekikei_nai = jishokei_a+"させない"
          shiekikei_ta = jishokei_a+"させた"
          shiekikei_nai_ta = jishokei_a+"させなかった"
        end
        "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
            "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
            "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
            "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          shiekikei = jishokei_a+"させる"
          kana_shiekikei = jishokei_b+"させる"
          shiekikei_nai = jishokei_a+"させない"
          kana_shiekikei_nai = jishokei_b+"させない"
          shiekikei_ta = jishokei_a+"させた"
          kana_shiekikei_ta = jishokei_b+"させた"
          shiekikei_nai_ta = jishokei_a+"させなかった"
          kana_shiekikei_nai_ta = jishokei_b+"させなかった"
        else
          shiekikei = jishokei_a+"させる"
          kana_shiekikei = jishokei_b+"させる"
          shiekikei_nai = jishokei_a+"させない"
          kana_shiekikei_nai = jishokei_b+"させない"
          shiekikei_ta = jishokei_a+"させた"
          kana_shiekikei_ta = jishokei_b+"させた"
          shiekikei_nai_ta = jishokei_a+"させなかった"
          kana_shiekikei_nai_ta = jishokei_b+"させなかった"
        end
        "["+shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
            "["+kana_shiekikei+"]["+spos+"][使役形][现在时肯定形]\n" +
            "["+shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
            "["+kana_shiekikei_nai+"]["+spos+"][使役形][现在时否定形]\n" +
            "["+shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
            "["+kana_shiekikei_ta+"]["+spos+"][使役形][过去时肯定形]\n" +
            "["+shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n" +
            "["+kana_shiekikei_nai_ta+"]["+spos+"][使役形][过去时否定形]\n"
      end
    end
  end
end

#shieki_ukemi:使役被动
def shieki_ukemi(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"

    if jishokei_a[-1] != "す"
      if jishokei_b.empty?

        shieki_ukemikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"される"
        shieki_ukemikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"されない"
        shieki_ukemikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"された"
        shieki_ukemikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"されなかった"

        "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n"

      else

        shieki_ukemikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"される"
        kana_shieki_ukemikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"される"
        shieki_ukemikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"されない"
        kana_shieki_ukemikei_nai = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"されない"
        shieki_ukemikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"された"
        kana_shieki_ukemikei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"された"
        shieki_ukemikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"されなかった"
        kana_shieki_ukemikei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"されなかった"

        "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+kana_shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+kana_shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+kana_shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n" +
            "["+kana_shieki_ukemikei_nai_ta+"][#{spos}][使役被动形][过去时否定形]\n"

      end
    else
      if jishokei_b.empty?

        shieki_ukemikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられる"
        shieki_ukemikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられない"
        shieki_ukemikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられた"
        shieki_ukemikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられなかった"

        "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n"

      else

        shieki_ukemikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられる"
        kana_shieki_ukemikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せられる"
        shieki_ukemikei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられない"
        kana_shieki_ukemikei_nai = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せられない"
        shieki_ukemikei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられた"
        kana_shieki_ukemikei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せられた"
        shieki_ukemikei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][0]+"せられなかった"
        kana_shieki_ukemikei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][0]+"せられなかった"

        "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+kana_shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+kana_shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+kana_shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n" +
            "["+kana_shieki_ukemikei_nai_ta+"][#{spos}][使役被动形][过去时否定形]\n"

      end
    end

  elsif spos[-1]=="２"
    if jishokei_b.empty?

      shieki_ukemikei = jishokei_a.chop+"させられる"
      shieki_ukemikei_nai = jishokei_a.chop+"させられない"
      shieki_ukemikei_ta = jishokei_a.chop+"させられた"
      shieki_ukemikei_nai_ta = jishokei_a.chop+"させられなかった"

      "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
          "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
          "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
          "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n"

    else

      shieki_ukemikei = jishokei_a.chop+"させられる"
      kana_shieki_ukemikei = jishokei_b.chop+"させられる"
      shieki_ukemikei_nai = jishokei_a.chop+"させられない"
      kana_shieki_ukemikei_nai = jishokei_b.chop+"させられない"
      shieki_ukemikei_ta = jishokei_a.chop+"させられた"
      kana_shieki_ukemikei_ta = jishokei_b.chop+"させられた"
      shieki_ukemikei_nai_ta = jishokei_a.chop+"させられなかった"
      kana_shieki_ukemikei_nai_ta = jishokei_b.chop+"させられなかった"

      "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
          "["+kana_shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
          "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
          "["+kana_shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
          "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
          "["+kana_shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
          "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n" +
          "["+kana_shieki_ukemikei_nai_ta+"][#{spos}][使役被动形][过去时否定形]\n"

    end
  else
    if jishokei_a=="来る"

      shieki_ukemikei = "来させられる"
      kana_shieki_ukemikei = "こさせられる"
      shieki_ukemikei_nai = "来させられない"
      kana_shieki_ukemikei_nai = "こさせられない"
      shieki_ukemikei_ta = "来させられた"
      kana_shieki_ukemikei_ta = "こさせられた"
      shieki_ukemikei_nai_ta = "来させられなかった"
      kana_shieki_ukemikei_nai_ta = "こさせられなかった"

      "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
          "["+kana_shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
          "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
          "["+kana_shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
          "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
          "["+kana_shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
          "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n" +
          "["+kana_shieki_ukemikei_nai_ta+"][#{spos}][使役被动形][过去时否定形]\n"

    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          shieki_ukemikei = jishokei_a+"させられる"
          shieki_ukemikei_nai = jishokei_a+"させられない"
          shieki_ukemikei_ta = jishokei_a+"させられた"
          shieki_ukemikei_nai_ta = jishokei_a+"させられなかった"
        else
          shieki_ukemikei = jishokei_a+"させられる"
          shieki_ukemikei_nai = jishokei_a+"させられない"
          shieki_ukemikei_ta = jishokei_a+"させられた"
          shieki_ukemikei_nai_ta = jishokei_a+"させられなかった"
        end
        "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          shieki_ukemikei = jishokei_a.chop+"させられる"
          kana_shieki_ukemikei = jishokei_b.chop+"させられる"
          shieki_ukemikei_nai = jishokei_a.chop+"させられない"
          kana_shieki_ukemikei_nai = jishokei_b.chop+"させられない"
          shieki_ukemikei_ta = jishokei_a.chop+"させられた"
          kana_shieki_ukemikei_ta = jishokei_b.chop+"させられた"
          shieki_ukemikei_nai_ta = jishokei_a.chop+"させられなかった"
          kana_shieki_ukemikei_nai_ta = jishokei_b.chop+"させられなかった"
        else
          shieki_ukemikei = jishokei_a.chop+"させられる"
          kana_shieki_ukemikei = jishokei_b.chop+"させられる"
          shieki_ukemikei_nai = jishokei_a.chop+"させられない"
          kana_shieki_ukemikei_nai = jishokei_b.chop+"させられない"
          shieki_ukemikei_ta = jishokei_a.chop+"させられた"
          kana_shieki_ukemikei_ta = jishokei_b.chop+"させられた"
          shieki_ukemikei_nai_ta = jishokei_a.chop+"させられなかった"
          kana_shieki_ukemikei_nai_ta = jishokei_b.chop+"させられなかった"
        end
        "["+shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+kana_shieki_ukemikei+"]["+spos+"][使役被动形][现在时肯定形]\n" +
            "["+shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+kana_shieki_ukemikei_nai+"]["+spos+"][使役被动形][现在时否定形]\n" +
            "["+shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+kana_shieki_ukemikei_ta+"]["+spos+"][使役被动形][过去时肯定形]\n" +
            "["+shieki_ukemikei_nai_ta+"]["+spos+"][使役被动形][过去时否定形]\n" +
            "["+kana_shieki_ukemikei_nai_ta+"][#{spos}][使役被动形][过去时否定形]\n"
      end
    end
  end
end

#meirei:命令
def meirei(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"

    if jishokei_b.empty?

      meireikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]

      "["+meireikei+"]["+spos+"][命令形]\n"

    else

      meireikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]
      kana_meireikei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][2]

      "["+meireikei+"]["+spos+"][命令形]\n" +
          "["+kana_meireikei+"]["+spos+"][命令形]\n"


    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?

      meireikei = jishokei_a.chop+"ろ"

      "["+meireikei+"]["+spos+"][命令形]\n"

    else

      meireikei = jishokei_a.chop+"ろ"
      kana_meireikei = jishokei_b.chop+"ろ"

      "["+meireikei+"]["+spos+"][命令形]\n" +
          "["+kana_meireikei+"]["+spos+"][命令形]\n"

    end
  else
    if jishokei_a=="来る"

      meireikei = "来い"
      kana_meireikei = "こい"

      "["+meireikei+"]["+spos+"][命令形]\n" +
          "["+kana_meireikei+"]["+spos+"][命令形]\n"

    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          meireikei = jishokei_a+"しろ"
        else
          meireikei = jishokei_a+"しろ"
        end
        "["+meireikei+"]["+spos+"][命令形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          meireikei = jishokei_a+"しろ"
          kana_meireikei = jishokei_b+"しろ"
        else
          meireikei = jishokei_a+"しろ"
          kana_meireikei = jishokei_b+"しろ"
        end
        "["+meireikei+"]["+spos+"][命令形]\n" +
            "["+kana_meireikei+"]["+spos+"][命令形]\n"
      end
    end
  end
end

#katei：假定
def katei(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"
    if jishokei_b.empty?

      kateikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"ば"

      "["+kateikei+"]["+spos+"][假定形]\n"

    else

      kateikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"ば"
      kana_kateikei = jishokei_b.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"ば"

      "["+kateikei+"]["+spos+"][假定形]\n" +
          "["+kana_kateikei+"]["+spos+"][假定形]\n"

    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?

      kateikei = jishokei_a.chop+"れば"

      "["+kateikei+"]["+spos+"][假定形]\n"

    else

      kateikei = jishokei_a.chop+"れば"
      kana_kateikei = jishokei_b.chop+"れば"

      "["+kateikei+"]["+spos+"][假定形]\n" +
          "["+kana_kateikei+"]["+spos+"][假定形]\n"

    end
  else
    if jishokei_a=="来る"

      kateikei = "来れば"
      kana_kateikei = "くれば"

      "["+kateikei+"]["+spos+"][假定形]\n" +
          "["+kana_kateikei+"]["+spos+"][假定形]\n"

    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          kateikei = jishokei_a+"すれば"
        else
          kateikei = jishokei_a+"すれば"
        end
        "["+kateikei+"]["+spos+"][假定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          kateikei = jishokei_a+"すれば"
          kana_kateikei = jishokei_b+"すれば"
        else
          kateikei = jishokei_a+"すれば"
          kana_kateikei = jishokei_b+"すれば"
        end
        "["+kateikei+"]["+spos+"][假定形]\n" +
            "["+kana_kateikei+"]["+spos+"][假定形]\n"
      end
    end
  end
end

#kanou:可能
def kanou(line, spos)

  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"

    if jishokei_b.empty?

      kanoukei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"る"
      kanoukei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"ない"
      kanoukei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"た"
      kanoukei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"なかった"

      "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"

    else

      kanoukei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"る"
      kana_kanoukei = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][2]+"る"
      kanoukei_nai = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"ない"
      kana_kanoukei_nai = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][2]+"ない"
      kanoukei_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"た"
      kana_kanoukei_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][2]+"た"
      kanoukei_nai_ta = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][2]+"なかった"
      kana_kanoukei_nai_ta = jishokei_b.chop+$gojyuuon[jishokei_b[-1].to_sym][2]+"なかった"

      "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kana_kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kana_kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kana_kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n" +
          "["+kana_kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"

    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?

      kanoukei = jishokei_a.chop+"られる"
      kanoukei_nai = jishokei_a.chop+"られない"
      kanoukei_ta = jishokei_a.chop+"られた"
      kanoukei_nai_ta = jishokei_a.chop+"られなかった"

      "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"

    else

      kanoukei = jishokei_a.chop+"られる"
      kana_kanoukei = jishokei_b.chop+"られる"
      kanoukei_nai = jishokei_a.chop+"られない"
      kana_kanoukei_nai = jishokei_b.chop+"られない"
      kanoukei_ta = jishokei_a.chop+"られた"
      kana_kanoukei_ta = jishokei_b.chop+"られた"
      kanoukei_nai_ta = jishokei_a.chop+"られなかった"
      kana_kanoukei_nai_ta = jishokei_b.chop+"られなかった"

      "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kana_kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kana_kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kana_kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n" +
          "["+kana_kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"

    end
  else

    if jishokei_a=="来る"

      kanoukei = "来られる"
      kana_kanoukei = "こられる"
      kanoukei_nai = "来られない"
      kana_kanoukei_nai = "こられない"
      kanoukei_ta = "来られた"
      kana_kanoukei_ta = "こられた"
      kanoukei_nai_ta = "来られなかった"
      kana_kanoukei_nai_ta = "こられなかった"

      "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kana_kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
          "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kana_kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
          "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kana_kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
          "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n" +
          "["+kana_kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"

    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          kanoukei = jishokei_a+"できる"
          kanoukei_nai = jishokei_a+"できない"
          kanoukei_ta = jishokei_a+"できた"
          kanoukei_nai_ta = jishokei_a+"できなかった"
        else
          kanoukei = jishokei_a+"できる"
          kanoukei_nai = jishokei_a+"できない"
          kanoukei_ta = jishokei_a+"できた"
          kanoukei_nai_ta = jishokei_a+"できなかった"
        end
        "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
            "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
            "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
            "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          kanoukei = jishokei_a+"できる"
          kana_kanoukei = jishokei_b+"できる"
          kanoukei_nai = jishokei_a+"できない"
          kana_kanoukei_nai = jishokei_b+"できない"
          kanoukei_ta = jishokei_a+"できた"
          kana_kanoukei_ta = jishokei_b+"できた"
          kanoukei_nai_ta = jishokei_a+"できなかった"
          kana_kanoukei_nai_ta = jishokei_b+"できなかった"
        else
          kanoukei = jishokei_a+"できる"
          kana_kanoukei = jishokei_b+"できる"
          kanoukei_nai = jishokei_a+"できない"
          kana_kanoukei_nai = jishokei_b+"できない"
          kanoukei_ta = jishokei_a+"できた"
          kana_kanoukei_ta = jishokei_b+"できた"
          kanoukei_nai_ta = jishokei_a+"できなかった"
          kana_kanoukei_nai_ta = jishokei_b+"できなかった"
        end
        "["+kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
            "["+kana_kanoukei+"]["+spos+"][可能形][现在时肯定形]\n" +
            "["+kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
            "["+kana_kanoukei_nai+"]["+spos+"][可能形][现在时否定形]\n" +
            "["+kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
            "["+kana_kanoukei_ta+"]["+spos+"][可能形][过去时肯定形]\n" +
            "["+kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n" +
            "["+kana_kanoukei_nai_ta+"]["+spos+"][可能形][过去时否定形]\n"
      end
    end
  end
end

#ishi:意志
def ishi(line, spos)
  jishokei_a = line.split("「")[0]
  jishokei_b = line.split("「")[1].chop

  if spos[-1]=="１"
    if jishokei_b.empty?

      ishikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][3]+"う"

      "["+ishikei+"]["+spos+"][意志形]\n"

    else

      ishikei = jishokei_a.chop+$gojyuuon[jishokei_a[-1].to_sym][3]+"う"
      kana_ishikei = jishokei_b.chop+$gojyuuon[jishokei_a[-1].to_sym][3]+"う"

      "["+ishikei+"]["+spos+"][意志形]\n" +
          "["+kana_ishikei+"]["+spos+"][意志形]\n"

    end
  elsif spos[-1]=="２"
    if jishokei_b.empty?

      ishikei = jishokei_a.chop+"ろう"

      "["+ishikei+"]["+spos+"][意志形]\n"

    else

      ishikei = jishokei_a.chop+"ろう"
      kana_ishikei = jishokei_b.chop+"ろう"

      "["+ishikei+"]["+spos+"][意志形]\n" +
          "["+kana_ishikei+"]["+spos+"][意志形]\n"

    end
  else
    if jishokei_a=="来る"

      ishikei = "来よう"
      kana_ishikei = "こよう"

      "["+ishikei+"]["+spos+"][意志形]\n" +
          "["+kana_ishikei+"]["+spos+"][意志形]\n"

    else
      if /[a-zA-Z]/ =~ jishokei_b || jishokei_b.empty?
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
          end
          ishikei = jishokei_a+"しよう"
        else
          ishikei = jishokei_a+"しよう"
        end
        "["+ishikei+"]["+spos+"][意志形]\n"
      else
        if jishokei_a.length>=2 && jishokei_a[-2]+jishokei_a[-1]=="する"
          2.times do
            jishokei_a.chop!
            jishokei_b.chop!
          end
          ishikei = jishokei_a+"しよう"
          kana_ishikei = jishokei_b+"しよう"
        else
          ishikei = jishokei_a+"しよう"
          kana_ishikei = jishokei_b+"しよう"
        end
        "["+ishikei+"]["+spos+"][意志形]\n" +
            "["+kana_ishikei+"]["+spos+"][意志形]\n"
      end
    end
  end
end

#keiyou:形容
def keishou(line, spos)

  gokan_a = line.split("「")[0]
  gokan_b = line.split("「")[1].chop

  if spos.chop == "ナ"
    if /[a-zA-Z]/ =~ gokan_b || gokan_b.empty?
      "["+gokan_a+"だ]["+spos+"][现在时普通形]\n" +
          "["+gokan_a+"だった]["+spos+"][过去时普通形]\n" +
          "["+gokan_a+"ではない]["+spos+"][现在时否定形]\n" +
          "["+gokan_a+"ではなかった]["+spos+"][过去时否定形]\n" +
          "["+gokan_a+"な]["+spos+"][修饰名词]\n" +
          "["+gokan_a+"で]["+spos+"][并列中顿]\n"
    else
      "["+gokan_a+"だ]["+spos+"][现在时普通形]\n" + "["+gokan_b+"だ]["+spos+"][现在时普通形]\n" +
          "["+gokan_a+"だった]["+spos+"][过去时普通形]\n" + "["+gokan_b+"だった]["+spos+"][过去时普通形]\n" +
          "["+gokan_a+"ではない]["+spos+"][现在时否定形]\n" + "["+gokan_b+"ではない]["+spos+"][现在时否定形]\n" +
          "["+gokan_a+"ではなかった]["+spos+"][过去时否定形]\n" + "["+gokan_b+"ではなかった]["+spos+"][过去时否定形]\n" +
          "["+gokan_a+"な]["+spos+"][修饰名词]\n" + "["+gokan_b+"な]["+spos+"][修饰名词]\n" +
          "["+gokan_a+"で]["+spos+"][并列中顿]\n" + "["+gokan_b+"で][#{spos}][并列中顿]\n"
    end
  else
    if line.split("「")[0] == "いい"
      "[いい]["+spos+"][现在时普通形]\n" +
          "[よかった]["+spos+"][过去时普通形]\n" +
          "[よくない]["+spos+"][现在时否定形]\n" +
          "[よくなかった]["+spos+"][过去时否定形]\n"
    elsif /[a-zA-Z]/ =~ gokan_b || gokan_b.empty?
      "["+gokan_a+"]["+spos+"][现在时普通形]\n" +
          "["+gokan_a.chop+"かった]["+spos+"][过去时普通形]\n" +
          "["+gokan_a.chop+"くない]["+spos+"][现在时否定形]\n" +
          "["+gokan_a.chop+"くなかった]["+spos+"][过去时否定形]\n" +
          "["+gokan_a.chop+"くて]["+spos+"][并列递进]\n" +
          "["+gokan_a.chop+"く]["+spos+"][修饰动词]\n"
    else
      "["+gokan_a+"]["+spos+"][现在时普通形]\n" + "["+gokan_b+"]["+spos+"][现在时普通形]\n" +
          "["+gokan_a.chop+"かった]["+spos+"][过去时普通形]\n" + "["+gokan_b.chop+"かった]["+spos+"][过去时普通形]\n" +
          "["+gokan_a.chop+"くない]["+spos+"][现在时否定形]\n" + "["+gokan_b.chop+"くない]["+spos+"][现在时否定形]\n" +
          "["+gokan_a.chop+"くなかった]["+spos+"][过去时否定形]\n" + "["+gokan_b.chop+"くなかった]["+spos+"][过去时否定形]\n" +
          "["+gokan_a.chop+"くて]["+spos+"][并列递进]\n" + "["+gokan_b.chop+"くて]["+spos+"][并列递进]\n" +
          "["+gokan_a.chop+"く]["+spos+"][修饰动词]\n" + "["+gokan_b.chop+"く]["+spos+"][修饰动词]\n"
    end
  end
end