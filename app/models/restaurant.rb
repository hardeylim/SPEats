class Restaurant < ApplicationRecord
  has_many :restaurant_deliveries
  has_many :deliveries, through: :restaurant_deliveries

  has_many :restaurant_photos
  has_many :menu_templates

  belongs_to :default_menu_template, class_name: 'MenuTemplate', foreign_key: :default_menu_template_id
end
