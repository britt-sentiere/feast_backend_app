class AddTotalCheckToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :total_check, :integer
  end
end
