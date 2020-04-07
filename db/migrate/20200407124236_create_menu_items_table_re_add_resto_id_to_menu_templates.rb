class CreateMenuItemsTableReAddRestoIdToMenuTemplates < ActiveRecord::Migration[6.0]
  def change

    add_column :menu_templates, :restaurant_id, :integer
    remove_column :menu_templates, :column_name
    remove_column :menu_templates, :column_value

    remove_column :menu_items, :name
    remove_column :menu_items, :description

    add_column :menu_items, :column_name, :string
    add_column :menu_items, :column_value, :string
  end
end

