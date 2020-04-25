require 'benchmark'

dic = "Hanlp_CoreNatureDictionary_mini.txt"
word = "柳暗花明"

def taking_time(dic, word)
  File.open(dic) do |full|
    full.each do |all|
      if /^#{word}\t/ =~ all
        "find:#{word}"
      end
    end
  end
end

# 正则表达式匹配花费时间
Benchmark.bmbm(10) do |t|
  t.report("search:"){taking_time(dic, word)}
end
