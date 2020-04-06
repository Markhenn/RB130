# The Enumerable#max_by method iterates over the members of a collection, passing each element to the associated block. It then returns the element for which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays. It should take an Array and a block, and return the element that contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.
# Problem
# find the biggest element based on the blocks return value
# input: array
# output: element from array
#
# check return value from block
#  when bigger than last one, update function return value
#
# Algorithm
# set max to nil
# element = nil 
# call each on array
# yield to block
#   save block return to var
#   if block return is bigger than max (or nil)
#    save block return to max and value  to element
# return element

def max_by(array)
  max, element = nil
  array.each do |value|
    block_return = yield(value)
    if max.nil? || block_return > max
      max, element = block_return, value
    end
  end
  element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
