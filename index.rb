module Enumerable
    def my_each
      return enum_for unless block_given?
      arr = self.to_a
      for i in 0..(arr.length-1)
        yield(arr[i])
      end
      arr
    end

    def my_each_with_index
     return enum_for unless block_given?
     arr = self.to_a
     for i in 0..(arr.length-1)
      yield(arr[i],i)
    end
    arr
  end
  def my_select
    return enum_for unless block_given?
      newArr = []
      my_each {|x| newArr << x if yield(x)}
      newArr
    end
  def my_all?
    arr = self.to_a
    for item in 0..(arr.length-1)
      p arr[item] == true
    end
  end
end