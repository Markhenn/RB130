# Write a method that takes an array as an argument, and a block that returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.
#
# Problem
# return how often true was returned from block
# input: array
# output: int
# empty array => 0
# the array contents dont matter
#
# Algorithm
# true counter initialized to zero
# call each on on collection
# yield to block with !! to make it true or false
# if block returns true! -> increment counter
# return counter

def count1(collection)
  true_counter = 0
  collection.each { |element| true_counter += 1 if yield(element) }
  true_counter
end

def count_ls_student(collection, &block)
    collection.select(&block).size
end

def count(array)
  array.reduce(0) do |result, value|
    result += 1 if yield(value)
    result
  end
end

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2
