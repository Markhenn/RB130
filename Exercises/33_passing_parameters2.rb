# Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

# We can use the splat operator(*) to do something like this:

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block variables in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.
#
# Problem
# write a method with a block that takes the input array
# The block ignores the first 2 elements and groups the remaining elements as a
# raptor array
#
# input array and block
# output: not defined
#
# grouping using the splat operator

animals = %w(raven finch hawk eagle)

def grouping(array)
  yield(array) if block_given?
end

grouping(animals) { |_, _, *raptors| p raptors }
