class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
