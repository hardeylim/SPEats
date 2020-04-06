class OrderStatus < ApplicationRecord
  has_many :order_requests
end
