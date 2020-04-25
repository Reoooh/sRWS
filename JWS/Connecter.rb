require_relative 'mod/forward_segment'

test = ARGV[0]
dic = "dic/full_JD"

outcome = forward_segment(test, dic)

puts "FORWARD: #{outcome}"