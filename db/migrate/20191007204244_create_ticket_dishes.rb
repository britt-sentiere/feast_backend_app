class CreateTicketDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_dishes do |t|
      t.integer :dish_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
