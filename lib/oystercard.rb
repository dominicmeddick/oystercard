class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_list

  MAX_BALANCE = 90
  MIN_CHARGE = 1
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_list = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} exceeded" if @balance >= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station.nil? ? false : true
  end

  def touch_in(station)
    fail 'Insufficient balance to touch in' if @balance < MIN_CHARGE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_CHARGE)
    @exit_station = station
    journey
    @entry_station = nil
  end

  def journey
    @journey_list << {@entry_station => @exit_station}
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end