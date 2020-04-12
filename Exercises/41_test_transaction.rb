require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def setup
    @tra = Transaction.new(2)
    @tra.amount_paid = 5
  end

  def test_prompt_for_payment
    payment = StringIO.new("2\n")
    capture_io do
      @tra.prompt_for_payment(input: payment)
    end
    assert_equal(2, @tra.amount_paid)
  end
end
