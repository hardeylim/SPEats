class MenuTemplate < ActiveRecord
  belongs_to :restaurant
  has_many :menu_items
end
