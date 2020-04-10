class AddUserOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_order_details do |t|
      t.string :user_order_id
      t.boolean :is_pass
      t.string :notes
      t.timestamps
    end
  end
end
