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

end
