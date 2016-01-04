class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :unit_price
      t.belongs_to :merchant, index: true, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
