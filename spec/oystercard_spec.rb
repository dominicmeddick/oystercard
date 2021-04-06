require 'oystercard'

describe Oystercard do
  let (:card) { Oystercard.new }

  it 'responds to balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'has a balance' do
    expect(subject.balance).to eq(20)
  end
end