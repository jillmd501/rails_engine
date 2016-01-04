class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.integer :id
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
