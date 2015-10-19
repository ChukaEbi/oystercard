require 'oystercard'

describe Oystercard do
  it "should start with a balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "balance should increase when top up method is called" do
    subject.top_up 10
    expect(subject.balance).to eq 10
  end

  it "should raise an error if balance exceeds maximum" do
    subject.top_up(1)
    expect {subject.top_up(Oystercard::MAX_AMOUNT)}.to raise_error ("Balance exceeds #{Oystercard::MAX_AMOUNT}")
  end

  it 'balance should decrease when deduct method is called' do
    subject.top_up 10
    expect(subject.deduct 5).to eq 5
  end


end
