require 'benchmark'
require_relative 'mod/forward_segment'

test = ARGV[0]
dic = "dic/full_JD"

outcome = forward_segment(test, dic)

p outcome
Benchmark.bmbm(10) do |t|
  t.report("search:"){forward_segment(test, dic)}
end
