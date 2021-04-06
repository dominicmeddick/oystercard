require 'oystercard'

describe Oystercard do
  let (:card) { Oystercard.new }

  it 'responds to balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'has a balance' do
    expect(subject.balance).to eq(20)
  end

  it 'responds to top up' do
    expect(subject).to respond_to(:top_up)
  end

  it 'top_up takes arguments' do
    expect(subject).to respond_to(:top_up).with(1).arguments
  end

  it 'tops up the card' do
    expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
  end
end