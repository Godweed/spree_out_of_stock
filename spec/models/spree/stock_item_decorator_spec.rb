require 'spec_helper'

describe Spree::StockItem, type: :model do
  subject{described_class.create(
    variant: Spree::Variant.new(price: 1.0, is_master: true),
    stock_location: Spree::StockLocation.create
  )}

  context 'set count on hand' do
    context 'when count on hand > zero' do
      it 'do not store out of stock' do
        subject.set_count_on_hand(3)

        expect(Spree::OutOfStock.count).to eq(0)
      end
    end

    context 'when count on hand is zero' do
      it 'store a new OutOfStock record' do
        subject.set_count_on_hand(0)

        expect(Spree::OutOfStock.count).to eq(1)
      end
    end
  end
end
