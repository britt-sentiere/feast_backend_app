class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :currency
      t.integer :price
      t.string :description
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
