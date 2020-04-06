class Delivery < ApplicationRecord
  has_many :restaurant_deliveries
  has_many :restaurants, through: :restaurant_deliveries
end