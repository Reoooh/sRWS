filename = "Japanese_Dictionary"
$location = 0
file = File.open(filename)

file.each_line do |line|
  $location += 1
  if line.split("「")[1] == "」"
    puts $location
    p line
  end
end

file.close
