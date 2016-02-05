require 'csv'

namespace :import_customers_csv do
  task create_customers: :environment do
    csv_data = File.read("public/customers.csv")
    csv = CSV.parse(csv_data, headers: true)
    csv.each do |row|
      Customer.create(row.to_hash)
    end
  end
end

namespace :data do
  desc "Import the Customers, Invoice Items, Invoices, Items, Merchants, and Transactions files into models in our DB."
  task :import => :environment do
    customers_data = File.read("#{Rails.root}/lib/assets/customers.csv")
    customers_csv  = CSV.parse(customers_data, headers: true)

    customers_csv.each do |row|
      Customer.create(row.to_hash)
    end

    merchants_data = File.read("#{Rails.root}/lib/assets/merchants.csv")
    merchants_csv  = CSV.parse(merchants_data, headers: true)

    merchants_csv.each do |row|
      Merchant.create(row.to_hash)
    end

    items_data = File.read("#{Rails.root}/lib/assets/items.csv")
    items_csv  = CSV.parse(items_data, headers: true)

    items_csv.each do |row|
      Item.create(row.to_hash)
    end

    invoices_data = File.read("#{Rails.root}/lib/assets/invoices.csv")
    invoices_csv  = CSV.parse(invoices_data, headers: true)

    invoices_csv.each do |row|
      Invoice.create(row.to_hash)
    end

    transactions_data = File.read("#{Rails.root}/lib/assets/transactions.csv")
    transactions_csv  = CSV.parse(transactions_data, headers: true)

    transactions_csv.each do |row|
      Transaction.create(row.to_hash.except!("credit_card_expiration_date"))
    end

    invoice_items_data = File.read("#{Rails.root}/lib/assets/invoice_items.csv")
    invoice_items_csv  = CSV.parse(invoice_items_data, headers: true)

    invoice_items_csv.each do |row|
      InvoiceItem.create(row.to_hash)
    end
  end
end
