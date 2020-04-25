# test = "あ「」「嘆」「啊 呀 喂」"
 test = '遠回り「とおまわり」「名.ナ形.自動３.自動」「」'
# test = '遠回り「とおまわり」「名」「」'
# test = '         '

test = test.split('」「')
p test[1]
p test[1].class
test = test[1].split('.')
p test
test.each do |i|
  case i
  when '名'
    puts "right"
  when '代'
    puts "right"
  when 'イ形'
    puts "right"
  when 'ナ形'
    puts "right"
  when '副'
    puts "right"
  when '助'
    puts "right"
  when '嘆'
    puts "right"
  when '接'
    puts "right"
  when '連体'
    puts "right"
  when '連語'
    puts "right"
  when '接頭'
    puts "right"
  when '接尾'
    puts "right"
  when '他動１'
    puts "right"
  when '他動２'
    puts "right"
  when '他動３'
    puts "right"
  when '自動１'
    puts "right"
  when '自動２'
    puts "right"
  when '自動３'
    puts "right"
  when '自他動'
    puts "right"
  else
    puts "wrong"
  end
end

# 「名」「名词」
# 「代」「代词」
# 「イ形」「形容词」
# 「ナ形」「形容动词」
# 「副」「副词」
# 「助」「助词」
# 「嘆」「感叹词」
# 「接」「接续词」
# 「連体」「连体词」
# 「連語」「连语（词组）」
# 「接頭」「接头词」
# 「接尾」「接尾词」
# 「他動１」「一类他动词」
# 「他動２」「二类他动词」
# 「他動３」「三类他动词」
# 「自動１」「一类自动词」
# 「自動２」「二类自动词」
# 「自動３」「三类自动词」
# 「自他動」「自动词他动词两用」