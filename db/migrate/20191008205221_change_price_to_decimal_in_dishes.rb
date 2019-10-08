class ChangePriceToDecimalInDishes < ActiveRecord::Migration[6.0]
  def change
    change_column :dishes, :price, "numeric USING CAST(price AS numeric)"
    change_column :dishes, :price, :decimal, precision: 6, scale: 2
  end
end
