class AddAdditionalFieldsForRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :default_menu_template_id, :integer
    add_column :restaurants, :profile_image_id, :integer
    add_column :restaurants, :is_second_option_required, :boolean
    add_column :restaurants, :show_menu_images, :boolean
    add_column :restaurants, :notes, :string

    create_table :menu_templates do |t|
      t.integer :restaurant_id
      t.string :name
      t.timestamps
    end

    create_table :menu_items do |t|
      t.integer :menu_template_id
      t.string :name
      t.string :description
      t.timestamps
    end

    create_table :restaurant_photos do |t|
      t.integer :restaurant_id
      t.string :url
      t.timestamps
    end

  end
end
