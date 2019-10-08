class Dish < ApplicationRecord
  belongs_to :ticket_dish
  belongs_to :restaurant
end
