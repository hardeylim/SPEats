class UserOrder < ApplicationRecord
  belongs_to :user
  belongs_to :order_request
  belongs_to :status, class_name: 'OrderStatus'
  belongs_to :detail, class_name: 'UserOrderDetail'
end
