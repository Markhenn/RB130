# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.
#
# Problem
# return missing numbers from a sorted array
# input: sorted array
# output: array
#
# edge cases
#   no missing numbers -> empty array
#   only one number -> empty array
#
#   testcases see below
#
# Algorithm
# loop over array
#   check if current number +1 is equal to next number in array
#    if yes go to next array item
#    if no -> add number to new array and add +1 again and check with next item
#   return new array
#
#   create a range from first to last as array than delete the items from the
#   first array from the range

def missing1(array)
  (array.first..array.last).to_a - array
end

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
