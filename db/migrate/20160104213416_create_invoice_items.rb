class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :invoice, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
    end
  end
end
