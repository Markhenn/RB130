# NOTE: This exercise was originally a duplicate from the previous exercise set. We have modified it slightly, but some of the posted solutions still reflect the original wording.

# The Enumerable#count method iterates over the members of a collection, passing each element to the associated block. It then returns the number of elements for which the block returns a truthy value.

# Write a method called count that behaves similarly for an arbitrarily long list of arguments. It should take 0 or more arguments and a block, and then return the total number of arguments for which the block returns true.

# If the argument list is empty, count should return 0.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

# Problem
# recreate the count method
# input: list of arguments arbitrarily long
# output: int
# It takes a block which takes each argument in turn
# count how often the block evaluates to true
#
# Algorithm
# use splat operator to turn argments into array
# call inject on array
#  when block returns true
#    add 1 to counter
#  when not just counter

def count(*arguments)
  arguments.inject(0) do |counter, element|
    counter += 1 if yield(element)
    counter
  end
end

puts count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3
