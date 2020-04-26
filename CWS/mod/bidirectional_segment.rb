require_relative 'forward_segment'
require_relative 'backward_segment'

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
