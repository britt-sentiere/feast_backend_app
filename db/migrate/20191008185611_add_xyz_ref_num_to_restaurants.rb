class AddXyzRefNumToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :xyz_ref_num, :integer
  end
end
