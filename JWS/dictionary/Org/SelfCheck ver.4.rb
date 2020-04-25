$location = 1

def if_empty(line)
  puts "the blank line: #{$location}" if line.chomp.empty?
end

def if_translation_empty(line)
  line = line.split("「")
  translation = line[-1].chop
  puts "the empty translation: #{$location}" if translation.empty?
end

def part_of_speech(line)
  if line !~/^#/
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
        puts "the part of speech wrong: #{$location}"
        return
      end
    end
  end
end

def format_right(line)
  if line =~ /「.*」「.*」「.*」/
    $location += 1
  elsif line =~/^#/
    $location += 1
  elsif line.chomp.empty?
    $location += 1
  else
#    puts line.inspect
#    p line.chomp.empty?
    puts "the wrong format: #{$location}"
    $location += 1
  end
end

filename = "Japanese_Dictionary"
file = File.open(filename)

file.each_line do |line|
  if_empty(line)
  if_translation_empty(line)
  part_of_speech(line)
  format_right(line)
end

file.close
puts "Finished in #{$location-1}"

len = IO.readlines(filename)
p len.length