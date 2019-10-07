class ChangeColumnForDishes < ActiveRecord::Migration[6.0]
  def change
    change_column :dishes, :currency, :string
  end
end
