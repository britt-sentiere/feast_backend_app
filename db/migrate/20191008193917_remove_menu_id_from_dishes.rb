class RemoveMenuIdFromDishes < ActiveRecord::Migration[6.0]
  def change
    remove_column :dishes, :menu_id, :integer
  end
end
