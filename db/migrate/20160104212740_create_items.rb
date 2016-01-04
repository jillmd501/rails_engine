class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
