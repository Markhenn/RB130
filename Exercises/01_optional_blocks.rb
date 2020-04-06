# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.
#
# Problem
# The method should execute the block
# input: optional block
# output: return value of block or message
#
# Test Cases: see below
#
# Data Structure: Method with block yield
#
# Algorithm
# check if block is passed 
#   yes -> yield to block
#   no -> return message

def compute
  return 'Does not compute.' unless block_given?
  yield
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

def compute1(start)
  return 'Does not compute.' unless block_given?
  yield(start)
end

puts compute1(10) { |start| start + 5 + 3 } == 18
puts compute1('c') { |start| start + 'a' + 'b' } == 'cab'
puts compute1(nil) == 'Does not compute.'
