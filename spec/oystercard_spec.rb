require 'oystercard'

describe Oystercard do
  it "should start with a balance of zero" do
    expect(subject.balance).to eq 0
  end

  it {is_expected.to respond_to(:top_up ).with(1).argument}

  it "should raise an error if balance exceeds maximum" do
    subject.top_up(1)
    expect {subject.top_up(Oystercard::MAX_AMOUNT)}.to raise_error ("Balance exceeds #{Oystercard::MAX_AMOUNT}")
  end


end
