# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.
#
# Problem
# change to method to take a block
#
#

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

ather(items) { |produce| puts produce.join('; ') }
