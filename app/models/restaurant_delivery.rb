class RestaurantDelivery < ApplicationRecord
  belongs_to :restaurant
  belongs_to :delivery
end
