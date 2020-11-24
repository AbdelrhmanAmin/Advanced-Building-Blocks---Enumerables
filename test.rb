
require_relative 'index.rb'
p "Examples"
p [ "a", "b", "c" ].my_each {|x| print x, " -- " }
p (1..3).my_each {|x| print x, " -- " }
p ["A", "B", "C"].my_each_with_index { |val, index| puts "Element #{val} is on index #{index}" }
p [1,2,3,4,5].my_select { |num|  num.even?  }
p [nil, true, 99].my_all?