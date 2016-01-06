class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def total_revenue
    Invoice.where(:merchant_id => self.id).joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
  end
  
end
