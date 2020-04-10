class ChangeUserOrdersAndUserOrderDetailsRelationship < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_order_details, :user_order_id
    remove_column :user_orders, :order
    add_column :user_orders, :user_order_detail_id, :integer
  end
end
