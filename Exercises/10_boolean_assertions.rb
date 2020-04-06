# Write a minitest assertion that will fail if the value.odd? is not true.

# Problem
# Write a test for a method
#

require 'minitest/autorun'

value = 3


def OddTest < Minitest::Test
  def test_is_it_odd
    assert(value.odd?, 'value is not odd')
  end
end
