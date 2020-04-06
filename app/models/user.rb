class User < ApplicationRecord
  belongs_to :permission
  belongs_to :position_title

  has_many :user_orders


end
