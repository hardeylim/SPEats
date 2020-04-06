class OrderRequest < ApplicationRecord
  belongs_to :restaurant
  belongs_to :order_status

  has_many :user_orders
end
