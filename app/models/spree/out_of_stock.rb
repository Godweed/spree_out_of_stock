module Spree
  class OutOfStock < Spree::Base
    belongs_to :stock_item
  end
end
