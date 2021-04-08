class Oystercard

  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MIN_CHARGE = 1

  def initialize
    @in_journey = false
    @balance = 0
    @entry_station = entry_station
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    entry_station != nil
  end

  def touch_in(station)
    fail 'Insufficient balance to touch in' if @balance < MIN_CHARGE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end