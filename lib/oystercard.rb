class Oystercard 
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 20
  end

  def top_up(amount)
    @balance += amount
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if @balance > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end