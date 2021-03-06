class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :merchant, index: true, foreign_key: true
      t.belongs_to :customer, index: true, foreign_key: true
    end
  end
end
