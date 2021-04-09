require 'oystercard'
describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station}
  
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

  describe '#journey' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  
    it 'can touch in' do
     subject.top_up(1)
     subject.touch_in(entry_station)
     expect(subject).to be_in_journey
    end

    it 'stores the entry station in' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  
    it 'can touch out' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by (-Oystercard::MIN_CHARGE)
      expect(subject).not_to be_in_journey
    end

    it 'stores the exit station' do
      subject.top_up(1)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  
    it 'will not touch in if below minimum balance' do
     expect { subject.touch_in(entry_station) }.to raise_error 'Insufficient balance to touch in'
    end
  end

  describe '#recordthejourneys' do

    it 'stores the entry and exit station in a hash' do
      subject.top_up(1)
      subject.touch_in(entry_station) 
      subject.touch_out(exit_station)
      expect(subject.journey_list).to eq([{ entry_station => exit_station }])
    end
  end

  describe '#initialize' do
    it 'checks that the card creates an empty journey list' do
      expect(subject.journey_list).to eq([])
    end



  end
end