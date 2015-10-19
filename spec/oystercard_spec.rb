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
    message = "Balance exceeds #{Oystercard::MAX_AMOUNT}"
    expect {subject.top_up(Oystercard::MAX_AMOUNT)}.to raise_error message
  end

  it 'balance should decrease when deduct method is called' do
    subject.top_up 10
    expect(subject.deduct 5).to eq 5
  end

  it "should not be in use" do
    expect(subject.in_journey?).to be_falsey
  end

  it "should be in use if touched in" do
    subject.top_up 5
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "should not be in use if touched out" do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "should raise an error if the minimum amount is not on the card" do
    message = "The minimum amount for this journey is #{Oystercard::MIN_AMOUNT}"
    expect{subject.touch_in}.to raise_error message
  end


end
