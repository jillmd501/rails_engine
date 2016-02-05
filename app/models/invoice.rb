class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  scope :successful, -> { joins(:transactions).where(transactions: {result: "success"}) }
  scope :unsuccessful, -> { joins(:transactions).where(transactions: {result: "failed"}) }
end
