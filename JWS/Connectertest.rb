require 'benchmark'
require_relative 'mod/forward_segment'

test = "いつか北海道へ行きたいです。"
dic = "dic/full_JD"

outcome = forward_segment(test, dic)

p outcome
Benchmark.bmbm(10) do |t|
  t.report("search:"){forward_segment(test, dic)}
end
