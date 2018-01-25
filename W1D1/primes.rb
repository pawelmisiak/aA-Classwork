# primes.rb
require 'byebug'


def prime?(num)
  debugger
  (2..num).each do |number|
    if num % number == 0
      return false
    end
  end
  true
end

def primes(num_primes)
  ps = []
  num = 1
  while ps.count < num_primes
    ps << num if prime?(num)
  end
  ps
end

if __FILE__ == $PROGRAM_NAME
  puts primes(100)
end
