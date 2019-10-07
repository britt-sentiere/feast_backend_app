class Ticket < ApplicationRecord
  belongs_to :user
  has_many :dishes, through: :ticket_dishes
end
