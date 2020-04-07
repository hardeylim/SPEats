class AddOrdersTables < ActiveRecord::Migration[6.0]
  def change
    add_column :order_requests, :deadline, :datetime
    add_column :order_requests, :menu_template_id, :integer
    add_column :user_orders, :is_pass, :boolean


    add_column :menu_templates, :column_name, :string
    add_column :menu_templates, :column_value, :string
  end
end
