require 'benchmark'

dic = "verb/c_dic"
word = "ワンピース"

=begin
File.open(dic) do |full|
  full.each do |all|
    if /^\[#{word}\]/ =~ all
      puts "find:#{word}"
    end
  end
end
=end

def taking_time(dic, word)
  File.open(dic) do |full|
    full.each do |all|
      if /^\[#{word}\]/ =~ all
        "find:#{word}"
      end
    end
  end
end

Benchmark.bmbm(10) do |t|
  t.report("search:"){taking_time(dic, word)}
end
