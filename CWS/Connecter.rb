require_relative 'mod/forward_segment'
require_relative 'mod/backward_segment'
require_relative 'mod/bidirectional_segment'

test = ARGV[0]
dic = "dic/Hanlp_CoreNatureDictionary_mini.txt"

outcome1 = forward_segment(test, dic)

puts "FORWARD: #{outcome1}"


outcome2 = backward_segment(test, dic)

puts "BACKWARD: #{outcome2}"


outcome3 = bidirectional_segment(test, dic)

puts "BIDIRECTIONAL: #{outcome3}"
