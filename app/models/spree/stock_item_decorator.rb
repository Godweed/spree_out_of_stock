Spree::StockItem.class_eval do
  alias_method :original_set_count_on_hand, :set_count_on_hand

  has_many :out_of_stocks

  #store a new out_of_stock record when set_on_count is called
  def set_count_on_hand(value)
    store_out_of_stock if value == 0
    return original_set_count_on_hand(value)
  end

  def store_out_of_stock
    self.out_of_stocks.build
  end
end
