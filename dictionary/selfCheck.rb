$location = 1

def format(line)
  if line =~ /「.*」「.*」「.*」/
    $location += 1
  elsif line =~/^#/
    $location += 1
  else
    puts $location
    $location += 1
  end
end

def part_of_speech(line)
  if line =~/^#/
  else
    line = line.split('」「')
    pos = line[1].to_s
    pos = pos.split('.')
    pos.each do |i|
      case i
      when '名'
      when '代'
      when 'イ形'
      when 'ナ形'
      when '副'
      when '助'
      when '嘆'
      when '接'
      when '連体'
      when '連語'
      when '接頭'
      when '接尾'
      when '他動１'
      when '他動２'
      when '他動３'
      when '自動１'
      when '自動２'
      when '自動３'
      when '自他動１'
      when '自他動２'
      when '自他動３'
      else
        p $location
      end
    end
  end
end


filename = "Japanese_Dictionary"
file = File.open(filename)

file.each_line do |line|
  part_of_speech(line)
  format(line)
end

file.close
puts $location