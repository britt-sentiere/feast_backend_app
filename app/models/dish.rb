class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :tickets, through: :ticket_dish
end
