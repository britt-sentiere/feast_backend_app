class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
