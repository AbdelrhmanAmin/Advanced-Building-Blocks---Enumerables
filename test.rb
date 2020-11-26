
require_relative 'index.rb'
p "Examples"
p [ "a", "b", "c" ].my_each {|x| print x, " -- " }
p (1..3).my_each {|x| print x, " -- " }
p ["A", "B", "C"].my_each_with_index { |val, index| puts "Element #{val} is on index #{index}" }
p [1,2,3,4,5].my_select { |num|  num.even?  }
p [nil, true, 99].my_all?

puts '5.--------my_any--------'
puts (%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
puts (%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
puts %w[ant bear cat].my_any?(/d/) #=> false
puts [nil, true, 99].my_any?(Integer) #=> true
puts [nil, true, 99].my_any? #=> true
puts [].my_any? #=> false

puts '6.--------my_none--------'
 puts (%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
 puts (%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
 puts %w[ant bear cat].my_none?(/d/) #=> true
 puts [1, 3.14, 42].my_none?(Float) #=> false
 puts [].my_none? #=> true
 puts [nil].my_none? #=> true
 puts [nil, false].my_none? #=> true
 puts [nil, false, true].my_none? #=> false

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
puts arr.my_count? #=> 4 arg==nil && !block_given
puts arr.my_count?(2) #=> 2 arg == n
puts (arr.my_count? { |x| (x % 2).zero? }) #=> 3 block_given?

puts '8.--------my_maps--------'
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
puts (my_order.my_map { |item| item.gsub('medium', 'extra large') })
puts ((0..5).my_map { |i| i * i })
puts 'my_map_proc'
my_proc = proc { |i| i * i }
puts (1..5).my_map(my_proc) { |i| i + i }