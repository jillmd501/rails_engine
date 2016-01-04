class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :merchants, index: true, foreign_key: true
      t.belongs_to :users, index: true, foreign_key: true 
    end
  end
end
