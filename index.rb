module Enumerable
  def my_each
    return enum_for unless block_given?

    arr = to_a
    (0..(arr.length - 1)).each do |i|
      yield(arr[i])
    end
    self
  end

  def my_each_with_index
    return enum_for unless block_given?

    arr = to_a
    (0..(arr.length - 1)).each do |i|
      yield(arr[i], i)
    end
    self
  end

  def my_select
    return enum_for unless block_given?

    new_arr = []
    my_each { |x| new_arr << x if yield(x) }
    new_arr
  end

  def my_all?(param = nil)
    return my_all? { |obj| obj } unless block_given? || !param.nil?

    my_each do |elem|
      return false if block_given? && !yield(elem)
      return false if param.is_a?(Class) && !elem.is_a?(param)
      return false if param.instance_of?(Regexp) && !elem.to_s.match(param.to_s)
      if param.is_a?(Integer) 
        return false if param != elem
      end
    end
    true
  end

  def my_any?(param = nil)
    return my_any? { |obj| obj } unless block_given? || !param.nil?

    my_each do |n|
      return true if param.is_a?(Class) && n.is_a?(param)
      return true if param.class == Regexp && n.to_s.match(param.to_s)
      return true if block_given? && yield(n)
      if param.is_a?(Integer) 
        return true if param == n
      end
    end
    false
  end

  def my_none?(param = nil)
    return my_none? { |obj| obj } unless block_given? || !param.nil?

    my_each do |n|
      return false if param.is_a?(Class) && n.is_a?(param)
      return false if param.class == Regexp && n.to_s.match(param.to_s)
      return false if block_given? && yield(n)
      if param.is_a?(Integer) 
        return false if param != n
      end
    end
    true
  end

  def my_count(param = nil)
    counter = 0
    return to_a.length if !block_given? && param.nil?

    if block_given?
      my_each { |num| counter += 1 if yield(num) }
    else
      my_each { |num| counter += 1 if param == num }
    end
    counter
  end

  def my_map(base = nil)
    return enum_for unless block_given? || !base.nil?

    new_arr = []
    if base
      my_each { |i| new_arr.push(base[i]) }
    elsif block_given?
      my_each { |i| new_arr.push(yield(i)) }
    end
    new_arr
  end

  def my_inject(sum = nil, opt = nil)
    if sum.is_a?(Symbol)
      sum = opt
      sum = nil
    end
    flag = opt.is_a?(Symbol)
    my_each_with_index do |elem, index|
      sum = if index.zero? && sum.nil?
              elem
            elsif !opt.nil? && flag == true
              opt = opt.to_proc
              sum = opt.call(sum,elem)
            else
              sum = yield(sum, elem)
            end
    end
    sum
  end
end

def multiply_els(elemts)
  elemts.my_inject { |acc, n| acc * n }
end
