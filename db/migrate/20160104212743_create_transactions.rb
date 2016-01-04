class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.string :result
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :invoices, index: true, foreign_key: true
    end
  end
end
