class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :invoices, index: true, foreign_key: true
    end
  end
end
