# Times method own implementation
#
# Problem
# Built a method that works like the times method
#   takes a block
#   count from 0 up to number - 1
#   the count is passed to block as local variable
#   returns the number put in
#
# Test Cases:
# times(5) { |num| puts num } == 5
#
# Data structe: method that yields to a block
#
# Algorithm
# define basic counting method
#   start at 0
#   count up to number - 1
#   pass the current number to the block

def times(number)
  index = 0

  return 'Enumerator' unless block_given?

  while index < number do
    yield(index)
    index += 1
  end

  number
end


puts times(5) { |num| puts num } == 5
puts times(5)
puts times(-5) { |num| puts num }

