require 'spec_helper'

describe Spree::OutOfStock, type: :model do
  it 'is valid with valid attributes' do
    expect(described_class.new(stock_item_id: 1)).to be_valid
  end

  it 'is not valid without a stock item' do
    expect(described_class.new).to_not be_valid
  end
end
