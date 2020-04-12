# In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, reset your Enumerator. Finally, reprint those same 7 factorials using your Enumerator object as an "Internal Iterator".

# Two final hints:

# You'll only need 3 Enumerator methods to complete this exercise.
# An Enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this exercise easier to write.
#

enumerator = %w(one two three).each_with_object('foo')
p enumerator
# begin
# puts enumerator.next
# puts enumerator.next
# puts enumerator.next
# puts enumerator.next
# puts enumerator.next
# rescue StopIteration
#   puts 'Out of bounds'
# end

enumerator.each {|element, obj| puts "#{obj}: #{ element }"}

enumerator.each_with_index {|(n, obj), i| puts "#{i}. #{obj}: #{n}"}

# Problem
# create an Enumerator object that contains an infinite number of factorials
# It would start like this => [1, 2, 6, 24, 120]
# each value is the factorial of the position
#
# Algorithm
# start with 1
#

fac = Enumerator.new do |yielder|
  step = 0
  value = 1
  loop do
    value = step.zero? ? 1 : step * value
    yielder << value
    step += 1
  end
end

p fac

p fac.take(5)

7.times { puts fac.next }

fac.rewind

fac.take(7).each { |fact| puts fact }
fac.each_with_index do |fact, idx| 
  break if idx == 7
  puts fact
end

test = [1, 2, 3].to_enum(:map)
p test
p test.each { |ele| ele + 1 }
p test.each { |ele| ele.odd? }
p test

sum = Enumerator.new do |yielder|
  num = 0
  loop do
    yielder << num
    num += 1
  end
end

p sum

4.times { puts sum.next }
sum.rewind
7.times { puts sum.next }
