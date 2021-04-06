class Oystercard 
  attr_reader :balance

  def initialize
    @balance = 20
  end

  def top_up(amount)
    @balance += amount
  end
end