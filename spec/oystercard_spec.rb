require 'oystercard'

describe Oystercard do
  
  describe '#balance' do
    it 'responds to balance' do
      expect(subject).to respond_to(:balance)
    end
  
    it 'has a balance' do
      expect(subject.balance).to eq(0)
    end
  
    it 'raises an error if balance exceeds £90' do
      max_bal = Oystercard::MAX_BALANCE
      subject.top_up(max_bal)
      expect { subject.top_up(1) }.to raise_error "Maximum balance of #{max_bal} exceeded"
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

  describe '#journey' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  
    it 'can touch in' do
     subject.top_up(1)
     subject.touch_in
     expect(subject).to be_in_journey
    end
  
    it 'can touch out' do
      subject.top_up(1)
      subject.touch_in
      subject.touch_out
      expect { subject.touch_out }.to change { subject.balance }.by (-Oystercard::MIN_CHARGE)
      expect(subject).not_to be_in_journey
    end
  
    it 'will not touch in if below minimum balance' do
     expect { subject.touch_in }.to raise_error 'Insufficient balance to touch in'
    end
  end
end
