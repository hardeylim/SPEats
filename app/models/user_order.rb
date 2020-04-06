class UserOrder < ApplicationRecord
  belongs_to :user
  belongs_to :order_request
  belongs_to :user_order_status
end
