class Restaurant < ApplicationRecord
  has_many :restaurant_deliveries
  has_many :deliveries, through: :restaurant_deliveries
end
