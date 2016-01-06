class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def revenue(params)
    if params[:date]
      invoices.successful.where(created_at: params[:date]).joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
    else
      invoices.successful.joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
    end
  end

  def favorite_customer
    customers = invoices.successful.group(:customer_id).count
    customers.max_by(1){|customer| customer[1]}.first[0]
  end

  def customers_with_pending_invoices
    invoices.unsuccessful.group(:customer_id).count
  end

end
