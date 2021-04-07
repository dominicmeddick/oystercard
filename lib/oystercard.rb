class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90
  MIN_CHARGE = 1

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail 'Insufficient balance to touch in' if @balance < MIN_CHARGE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_journey = false
  end

end