require 'byebug'

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i+=1
    end
    self
  end

  def my_select(&prc)
    array = []

    self.my_each do |el|
       if prc.call(el)
         array << el
       end
    end
    array
  end


  def my_reject(&prc)
    array = []

    self.my_each do |el|
      unless prc.call(el)
        array << el
      end
    end
    array
  end


  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end

    false
  end


  def my_flatten
    array = []

    self.my_each do |el|
      if el.class == Array
        # debugger
        array.concat(el.my_flatten)# [5, 6] => [5, 6]
        # [4] .concat[5, 6] => [4, 5, 6]
        # debugger
      else
        array << el
      end
      # debugger
    end
    array
  end

  def my_zip(*args)
    array = []

    (0...args.length).times do |i|
      temp = []
      temp << self[i]

      (0...args.length).times do |j|
        temp << args [j][i] # First el of each array
      end

      array << temp
    end

    array
  end



end

#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
