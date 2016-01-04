ActiveRecord::Schema.define(version: 20160104213416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  add_index "invoice_items", ["invoice_id"], name: "index_invoice_items_on_invoice_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merchant_id"
    t.integer  "customer_id"
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["merchant_id"], name: "index_invoices_on_merchant_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "merchant_id"
  end

  add_index "items", ["merchant_id"], name: "index_items_on_merchant_id", using: :btree

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "invoice_id"
    t.string   "credit_card_number"
    t.datetime "credit_card_expiration_date"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["invoice_id"], name: "index_transactions_on_invoice_id", using: :btree

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "merchants"
  add_foreign_key "items", "merchants"
  add_foreign_key "transactions", "invoices"
end
