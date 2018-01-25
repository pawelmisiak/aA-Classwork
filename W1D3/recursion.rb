require 'byebug'

def range(first, last)
  return [] if last < first
  return first if first == last - 1
  arr = []
  arr << first
  arr << range(first + 1, last)
  arr.flatten
end

def range_it(first, last)
  arr = []
  (last - 1).times do |i|
    arr << i + 1
  end
  arr
end

def power(num, pow)
  return 1 if pow == 0
  return 1 if num == 1
  return num if pow == 1
  
  num * power(num, pow-1)
end

def deep(array)
  arr = []
  return [] if array.empty?
  array.each do |el|
    if el.class != Array
      arr << el
      next
    else
      arr << deep(el)
    end
  end
  arr
end

# [0,1,1,2.....]

def fib_r(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  prev_seq = fib_r(n - 1)
  last_num = prev_seq[-1]
  second_to_last = prev_seq[-2]
  
  prev_seq << last_num + second_to_last  
end

def fib_i(n)
  result = [0, 1]
  return [0] if n == 1 
  return result if n == 2
  
  (n-2).times do
    result << result[-1] + result[-2]  
  end

  result
end


def subsets(array)
  arr = []
  return [[]] if array.empty?
  
  array.each do |el|
    arr << el # subsets([el])
    
  end
  
  arr.unshift([])
  arr << array
  arr
end

## ( [0, 1, 2, 3, 4, 5], 5 )

def bsearch(array, number)
   
  return nil if array.empty?

  size = array.length
  middle = size / 2
  
  return middle if array[middle] == number
  
  if number > array[middle]
    temp_search = bsearch(array[middle + 1..-1], number)
    return nil if temp_search == nil
    return temp_search + 1 + middle
  else
    return bsearch(array[0...middle], number) #=> 0
  end
  
end

def merge_sort(array)
  
end





#####
