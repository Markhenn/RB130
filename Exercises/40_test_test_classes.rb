require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def setup
    @cr = CashRegister.new(10)
    @tra = Transaction.new(2)
    @tra.amount_paid = 5
  end

  def test_accept_money
    previous_amount = @cr.total_money
    @cr.accept_money(@tra)
    current_amount = @cr.total_money
    assert_equal(previous_amount + 5, current_amount)
  end

  def test_change
    assert_same(3, @cr.change(@tra))
  end

  def test_give_receipt
    assert_output("You've paid $2.\n") { @cr.give_receipt(@tra) }
  end
end
