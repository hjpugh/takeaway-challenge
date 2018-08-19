require './lib/takeaway.rb'
require 'spec_helper'
require 'fake_sms'
  
describe Takeaway do
  def create(from, to, body)
    @messages << Message.new(from: from, to: to, body: body)
  end
end

describe '#take_order' do
  it 'returns a text confirming the order and delivery time' do
    subject.instance_variable_set(:@client, FakeSMS.new)
    allow(subject).to receive(:gets).and_return('3')
    allow(subject).to receive(:gets).and_return('0')
    expect(subject.take_order).to eq({name: "Pizza Margherita", num: 3, price: 8.05})
  end
end