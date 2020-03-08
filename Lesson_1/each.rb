# each method own version
#
# Problem
# Code my own each method
#   - returns the original array
#   - input and output is array
#   - iterates over array
#     - passes each element to block
#     - doesnt care about return value
#
# Test Case
# puts [1, 'abc', true].each { |elem| puts elem } == [1, 'abc', true]
#
# Algorithm
#   set counter to 0
#   while counter is smaller than array size
#     pass element of array to block
#     incement counter
#   return original array

def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

puts [1, 'abc', true].each { |elem| puts elem } == [1, 'abc', true]
