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
    ids = invoices.unsuccessful.pluck(:customer_id).uniq
    ids.map do |id|
      Customer.find(id)
    end
  end

  def most_revenue(params)

    # revenue = invoices.successful.joins(:invoice_items).group(:merchant_id, ("invoice_items.quantity * invoice_items.unit_price")).count
    # revenue.max_by(params|:quantity|.to_i){|id, quantity| quantity}
  end

end
