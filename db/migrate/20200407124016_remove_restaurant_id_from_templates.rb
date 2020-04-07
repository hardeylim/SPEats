class RemoveRestaurantIdFromTemplates < ActiveRecord::Migration[6.0]
  def change
    remove_column :menu_templates, :restaurant_id
  end
end
