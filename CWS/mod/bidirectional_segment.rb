=begin
#require 'forward_segment'
#require 'backward_segment'

#test = "欢迎新老师生前来就餐"
test = "结婚的和尚未结婚的"
dic = "dic/Hanlp_CoreNatureDictionary_mini.txt"

def forward_segment(text, dic)

  word_list = Array.new
  p word_list

  alphabet = text.split('')
  p alphabet

  io = File.open(dic)
  n = 0
  io.each_line do
    n += 1
  end
  io.close
  puts n

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
          if /^#{word}\t/ =~ all
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

def backward_segment(text, dic)

  word_list = Array.new
  p word_list

  alphabet = text.split('')
  p alphabet

  io = File.open(dic)
  n = 0
  io.each_line do
    n += 1
  end
  io.close
  puts n

  i = alphabet.length - 1

  while i >= 0
    longest_word = alphabet[i]
    p longest_word
    (0..i-1).each do |j|
      word = String.new
      (j..i).each do |k|
        word += alphabet[k]
      end
      p word
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
  p word_list

end

def count_single_char(list)
  num = 0
  list.each do |n|
    num += 1 if n.length == 1
  end
  num
end

def single_char_less(fn,bn,f,b)
  if fn < bn
    p f
  else
    p b
  end
end

def bidirectional_segment(text, dic)
  f = forward_segment(text, dic)
  b = backward_segment(text, dic)
  p f
  fn = count_single_char(f)
  p fn
  p b
  bn = count_single_char(b)
  p bn

  if f.length<b.length
    p f
  elsif f.length>b.length
    p b
  else
    single_char_less(fn,bn,f,b)
  end

end

bidirectional_segment(test, dic)
=end

#$LOAD_PATH << '.'
#require 'forward_segment'
#require 'backward_segment'

require_relative 'forward_segment'
require_relative 'backward_segment'

#test = "研究生命起源"
#dic = "Hanlp_CoreNatureDictionary_mini.txt"

def count_single_char(list)
  num = 0
  list.each do |n|
    num += 1 if n.length == 1
  end
  num
end

def single_char_less(fn,bn,f,b)
  if fn < bn
    @word_list = f

  else
    @word_list = b

  end
end

def bidirectional_segment(text, dic)

  f = forward_segment(text, dic)
  b = backward_segment(text, dic)

  # p f
  fn = count_single_char(f)
  # p fn
  # p b
  bn = count_single_char(b)
  # p bn

  if f.length<b.length
    @word_list = f

  elsif f.length>b.length
    @word_list = b

  else
    single_char_less(fn,bn,f,b)
  end

  @word_list
end

#bidirectional_segment(test, dic)
