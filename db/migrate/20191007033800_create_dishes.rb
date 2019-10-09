class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.integer :menu_id
      t.string :name
      t.decimal :price, precision: 7, scale: 2
      t.text :description

      t.timestamps
    end
  end
end