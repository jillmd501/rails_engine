class InvoiceItem < ActiveRecord::Base
  before_save :price_to_dollars

  belongs_to :item
  belongs_to :invoice

  def price_to_dollars
    self.unit_price = self.unit_price/100.0
  end
end
