# The Range#step method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.

# Write a method that does the same thing as Range#step, but does not operate on a range. Instead, your method should take 3 arguments: the starting value, the ending value, and the step value to be applied to each iteration. Your method should also take a block to which it will yield (or call) successive iteration values.

# Problem:
# recreate the Range#step method
# iterate over a range and hand the current value to a block
# Input: 3 Int, start, end, step
# output: ??? -> the original range?
#
# Test Code below
#
# Algorithm
# current value set to start
# loop
#   yield with current value
#   add step to current value
#   break if current value is bigger than stop
#
#   A good return value would be the original arguments as an array

def step(start, stop, increment)
  current_value = start
  loop do
    yield(current_value)
    current_value += increment
    break if current_value > stop
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# What do you think would be a good return value for this method, and why?
