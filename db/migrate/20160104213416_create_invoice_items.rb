class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.integer :id
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :invoice, index: true, foreign_key: true
      t.integer :quantity
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
