class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :unit_price
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :merchants, index: true, foreign_key: true
    end
  end
end
