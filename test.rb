
require_relative 'index.rb'
p "Examples"
p [ "a", "b", "c" ].my_each {|x| print x, " -- " }
p (1..3).my_each {|x| print x, " -- " }
p ["A", "B", "C"].my_each_with_index { |val, index| puts "Element #{val} is on index #{index}" }
p [1,2,3,4,5].my_select { |num|  num.even?  }
p [nil, true, 99].my_all?

puts '6.--------my_none--------'
 puts (%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
 puts (%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
 puts %w[ant bear cat].my_none?(/d/) #=> true
 puts [1, 3.14, 42].my_none?(Float) #=> false
 puts [].my_none? #=> true
 puts [nil].my_none? #=> true
 puts [nil, false].my_none? #=> true
 puts [nil, false, true].my_none? #=> false
