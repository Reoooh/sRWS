filename = "Japanese_Dictionary"
file = File.open(filename)
location = 1

file.each_line do |line|
  if line =~ /「.*」「.*」「.*」/
    location += 1
  elsif line =~/^#/
    location += 1
  else
    puts location
    location += 1
  end
end

file.close
puts location