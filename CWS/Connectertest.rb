# $LOAD_PATH << '.'
# require 'bidirectional_segment'
require 'benchmark'
require_relative 'mod/backward_segment'
require_relative 'mod/forward_segment'
require_relative 'mod/bidirectional_segment'

test = "研究生命起源"
dic = "dic/Hanlp_CoreNatureDictionary_mini.txt"

outcome1 = forward_segment(test, dic)

p outcome1
Benchmark.bmbm(10) do |t|
  t.report("search:"){forward_segment(test, dic)}
end

outcome2 = backward_segment(test, dic)

p outcome2
Benchmark.bmbm(10) do |t|
  t.report("search:"){backward_segment(test, dic)}
end

outcome3 = bidirectional_segment(test, dic)

p outcome3
Benchmark.bmbm(10) do |t|
  t.report("search:"){bidirectional_segment(test, dic)}
end
