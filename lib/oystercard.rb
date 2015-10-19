class Oystercard

  MAX_AMOUNT = 90
  attr_reader :balance

  def initialize(balance=0)
    @balance = balance
  end

  def top_up value
    raise "Balance exceeds #{MAX_AMOUNT}" if value + balance > MAX_AMOUNT
    @balance+= value
  end
end
