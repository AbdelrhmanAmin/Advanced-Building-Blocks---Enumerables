# frozen_string_literal: true

# inspiration: https://github.com/anapdh/enumerable-methods/blob/development/enumerables.rb
module Enumerable
  def my_each
    return enum_for unless block_given?

    arr = to_a
    (0..(arr.length - 1)).each do |i|
      yield(arr[i])
    end
    arr
  end

  def my_each_with_index
    return enum_for unless block_given?

    arr = to_a
    (0..(arr.length - 1)).each do |i|
      yield(arr[i], i)
  end
  def my_select
      return enum_for unless block_given?

      newArr = []
      my_each { |x| newArr << x if yield(x) }
      newArr
      end
  end

  def my_all?(param = nil)
    return my_all? { |obj| obj } unless block_given? || !param.nil?

    my_each do |elem|
      if block_given? && !yield(elem)
        return false

      elsif param.is_a?(Class) && !elem.is_a?(param)
        return false
      elsif param.class == Regexp && !elem.to_s.match(param.to_s)
        return false
      end
    end
    true
  end

  def my_any?(param = nil)
    return my_any? { |obj| obj } unless block_given? || !param.nil?

    my_each do |n|
      if param.is_a?(Class) && n.is_a?(param)
        return true

      elsif !param.class == Regexp && n.to_s.match(param.to_s)
        return true
      elsif block_given? && yield(n)
        return true
      end
    end
    false
  end
  def my_none?(param = nil)
    return my_none? { |obj| obj } unless block_given? || !param.nil?
    my_each do |n|
      if param.is_a?(Class) && n.is_a?(param)
        return false
      elsif !param.class == Regexp && n.to_s.match(param.to_s)
        return false
      elsif block_given? && yield(n)
        return false
      end
    end
    true
  end 
  def my_count?(param= nil)
    counter = 0
    if !block_given? && param.nil?
        return self.to_a.length
    elsif block_given?
        my_each { |num| counter+=1 if yield(num)}
    else
       my_each {|num| counter+=1 if param == num}
    end
    counter
  end
  def  my_map(base = nil)
    return my_map{|obj| obj} unless block_given? || !base.nil?
    newArr = []
    if base 
      my_each {|i| newArr.push(base[i])}
    elsif block_given?
      my_each {|i| newArr.push(yield(i))}
    end
    newArr
  end
  def my_inject(sum=nil, currentValue=nil)
    # if the input is range
    # create a var arr and loop through numbers 
    # if sum is given then yield and assign the value to sum
    # if sum is not given then  sum = 0 and yield the block
    # 
    if self.is_a?(Range)
      arr = self.to_a
      if sum != nil
        arr.my_each do |num|
          sum = yield(sum,num)
        end
      elsif sum == nil
        sum = 0
        arr.my_each do |num|
          sum = yield(sum,num)
        end
      end
      return sum
    end
    if self.is_a?(Array)
      print self
    end
  end
end



#  def my_inject(acc = nil #total
#   , operator = nil) # currentValue
#         if acc.is_a?(Symbol) #Typeof acc == symbol
#             operator = acc 
#             acc = nil
#         end
#         is_symbol = operator.is_a?(Symbol) # True / false
#         raise LocalJumpError if !block_given? && !is_symbol #if no block is given bcuz of yield
#         is_range = self.kind_of?(Range) # check of a range
#         my_each_with_index do | n, i | # num, index
#             if (is_range ? true : i == 0) && acc == nil
#                 acc = n #give the acc the first num of the range array
#             else
#                 if operator != nil && is_symbol # if the current Elem is true and a symbol
#                     operator = operator.to_proc #turn the elem to a proc
#                     acc = operator.call(acc, n) # invoke the proc
#                 else
#                     acc = yield(acc, n) #if not a symbol then yield the block
#                 end
#             end
#         end
#         return acc
#     end