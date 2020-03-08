# Reduce own method
#
# Problem
# Built your own reduce
# input: array
# output: a single object based on the return value of the block
#
# Reduce sends an accumulator and the element to the block
# the return value is set as the next accumulator value
#
# Test cases: below
#
# Algorithm
# intiliaze with second parameter default 0
# set counter to zero
# set accumulator to second parameter
# while counter less than array size
#   send element and accu to block
#   set accu  to return value of block
#   increment counter
#
# return accumulator

def reduce(array, start=nil)
  counter = start.nil? ? 1 : 0
  accumulator = start || array.first
  while counter < array.size
    current_element = array[counter]
    accumulator = yield(accumulator, current_element)
    counter += 1
  end
  accumulator
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# add the ability to use the first array value as starting value

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
