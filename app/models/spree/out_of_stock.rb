module Spree
  class OutOfStock < Spree::Base
    belongs_to :stock_item

    validates :stock_item_id, presence: true
  end
end
