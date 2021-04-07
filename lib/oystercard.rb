class Oystercard 
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize(in_journey = false)
    @balance = 20
    @in_journey = in_journey
  end

  def top_up(amount)
    @balance += amount
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if @balance > MAX_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end