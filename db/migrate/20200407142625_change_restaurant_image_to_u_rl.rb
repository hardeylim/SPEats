class ChangeRestaurantImageToURl < ActiveRecord::Migration[6.0]
  def change
    change_column :restaurants, :profile_image_id, :string
    rename_column :restaurants, :profile_image_id, :profile_image_url
  end
end
