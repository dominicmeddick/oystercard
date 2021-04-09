require 'station'

describe Station do

  it 'should have a name' do
    expect(subject.name).to eq subject.name
  end

  it 'should have a zone' do
    expect(subject.zone).to eq subject.zone
  end
end