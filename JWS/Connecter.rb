require_relative 'mod/forward_segment'

test = "いつか北海道へ行きたいです。"
dic = "dic/full_JD"

outcome = forward_segment(test, dic)

puts "FORWARD: #{outcome}"