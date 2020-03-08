# Select own version
#
# Problem
# Built my own select method
# input and output: an array
# output array can be empty or have any number of elements of the original array
# each element that the blocks returns true for is placed in new array
#
# Test cases: see below
#
# Algorithm:
# set counte to zero
# set return to empty array
# while counter is less than array size
#   check if element send element to block returns true
#     if yes append element to return
#   increment counter
# return return

def select(array)
  counter = 0
  return_array = []
  while counter < array.size
    return_array << array[counter] if yield(array[counter])
    counter += 1
  end
  return_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
