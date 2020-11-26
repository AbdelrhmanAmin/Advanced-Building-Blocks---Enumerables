# frozen_string_literal: true

require_relative 'index.rb'

puts '1.--------my_each--------'
%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }

puts '2.--------my_each_with_index--------'
%w[Sharon Leo Leila Brian Arun].my_each_with_index do |friend, index|
  puts friend if index.even?
end

puts '3.--------my_select--------'
puts (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })

puts '4.--------my_all--------'
puts (%w[ant bear cat].my_all? { |word| word.length >= 3 })
puts (%w[ant bear cat].my_all? { |word| word.length >= 4 })
puts %w[ant bear cat].my_all?(/t/)
puts [1, 2i, 3.14].my_all?(Numeric)
puts [].my_all?

puts '5.--------my_any--------'
puts (%w[ant bear cat].my_any? { |word| word.length >= 3 })
puts (%w[ant bear cat].my_any? { |word| word.length >= 4 })
puts %w[ant bear cat].my_any?(/d/)
puts [nil, true, 99].my_any?(Integer)
puts [nil, true, 99].my_any?
puts [].my_any?

puts '6.--------my_none--------'
puts (%w[ant bear cat].my_none? { |word| word.length == 5 })
puts (%w[ant bear cat].my_none? { |word| word.length >= 4 })
puts %w[ant bear cat].my_none?(/d/)
puts [1, 3.14, 42].my_none?(Float)
puts [].my_none?
puts [nil].my_none?
puts [nil, false].my_none?
puts [nil, false, true].my_none?

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
puts arr.my_count?
puts arr.my_count?(2)
puts (arr.my_count? { |x| (x % 2).zero? })

puts '8.--------my_maps--------'
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
puts (my_order.my_map { |item| item.gsub('medium', 'extra large')})
puts ((0..5).my_map { |i| i * i })
puts 'my_map_proc'
my_proc = proc { |i| i * i }
puts (1..5).my_map(&my_proc)

puts '8.--------my_inject--------'
puts ((1..5).my_inject { |sum, n| sum + n })
puts (1..5).my_inject(1) { |product, n| product * n }
longest = %w[ant bear cat].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest

puts 'multiply_els'
puts multiply_els([2, 4, 5])
