class MenuTemplate < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_items
end
