require 'oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }

  describe '#balance' do
    it 'responds to balance' do
      expect(subject).to respond_to(:balance)
    end
  
    it 'has a balance' do
      expect(subject.balance).to eq(20)
    end

    it 'raises an error if balance exceeds £90' do
      max_bal = Oystercard::MAX_BALANCE
      expect { subject.top_up(max_bal) }.to raise_error { "Maximum balance of #{max_bal} exceeded" }
    end
  end
  
  describe '#top_up' do
    it 'responds to top up' do
      expect(subject).to respond_to(:top_up)
    end
  
    it 'top_up takes arguments' do
      expect(subject).to respond_to(:top_up).with(1).arguments
    end
  
    it 'tops up the card' do
      expect { subject.top_up 5 }.to change{ subject.balance }.by 5
    end
  end

  describe '#deduct' do
    it 'responds to deduct' do
      expect(subject).to respond_to(:deduct)
    end
  
    it 'deduct takes arguments' do
      expect(subject).to respond_to(:deduct).with(1).arguments
    end
  
    it 'deduct from the card' do
      expect { subject.deduct 5 }.to change{ subject.balance }.by -5
    end
  end

    it 'is not #in_journey?' do
      expect(subject).not_to be_in_journey
    end

    it 'can touch_in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'responds to touch_out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
end