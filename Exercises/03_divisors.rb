# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.
#
# Problem
# return a list of divisors of a given number
# input: integer
# output: array of ints
#
# the lowest number will always be square root of a number after that it will
# have an oposite number
#
# use prime numbers 
# iterate through them and add all divisors
#
# Algorithm
# get all the prime numbers upto / inkl the square root of the number
# iterate over these prime numbers
#   check if number modulo prime is 0
#     then append prime to result
#     set new number to number / prime and append to result
#     iterate with while until new number mod prime is not 0
#       if yes append set new new number and append to result
#
# add 1 and number to result
# call uniq and sort on result 

def divisors(number)
  (1..number).select { |n| number % n == 0 }
end

require 'prime'
require 'benchmark'

def divisors_quick(number)
  result = [1, number]
  sqrt_number = Math::sqrt(number).to_i
  Prime.each(sqrt_number) do |prime|
    quotient, remainder = number.divmod(prime)
    if remainder.zero?
      result << prime << quotient
      while quotient % prime == 0
        quotient /= prime
        result << quotient
      end
    end
  end
  result.uniq.sort
end

def divisors_quick2(number)
  result = [1, number]
  sqrt_number = Math::sqrt(number).to_i
  Prime.each(sqrt_number) do |prime|
    quotient = number
    result << prime if quotient % prime == 0
    while quotient % prime == 0
      quotient, remainder = quotient.divmod(prime)
      result << quotient
    end
  end
  result.uniq.sort
end

def divisors_quick3(number)
  result = [1, number]
  sqrt_number = Math::sqrt(number).to_i
  Prime.each(sqrt_number) do |prime|
    quotient = number
    while quotient % prime == 0
      quotient, remainder = quotient.divmod(prime)
      result << prime if quotient * prime == number
      result << quotient
    end
  end
  result.uniq.sort
end


def divisors_john(n)
  2.upto(n**0.5 / 1).with_object([1, n]) do |i, arr|
    arr << i << n / i if (n % i).zero?
  end.uniq.sort
end

p divisors(1) == [1]
p divisors(4) == [1, 2, 4]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
puts 'Quick method'
p divisors_quick(4) == [1, 2, 4]
p divisors_quick(12) == [1, 2, 3, 4, 6, 12]
p divisors_quick(98) == [1, 2, 7, 14, 49, 98]
p divisors_quick(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors_quick3(999962000357) == [1, 999979, 999983, 999962000357]
# p divisors_quick(9999620003579999) == [1, 13, 6451, 1550088358949, 769201538736923, 9999620003579999]
# p Benchmark.realtime() { divisors(99400891) }
p Benchmark.realtime() { divisors_quick(99400891) }
p Benchmark.realtime() { divisors_quick(999962000357) }
p Benchmark.realtime() { divisors_quick2(99400891) }
p Benchmark.realtime() { divisors_quick2(999962000357) }
p Benchmark.realtime() { divisors_quick3(99400891) }
p Benchmark.realtime() { divisors_quick3(999962000357) }
p Benchmark.realtime() { divisors_quick3(1999620003579991) }
