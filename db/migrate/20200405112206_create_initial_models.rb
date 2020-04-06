class CreateInitialModels < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :basic_password
      t.integer :position_title_id
      t.integer :permission_id
      t.timestamps
    end

    create_table :position_titles do |t|
      t.string :name
      t.timestamps
    end

    create_table :permissions do |t|
      t.string :type
      t.timestamps
    end

    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.string :phone_number
      t.timestamps
    end

    create_table :restaurant_deliveries do |t|
      t.integer :restaurant_id
      t.integer :delivery_id
      t.timestamps
    end

    create_table :deliveries do |t|
      t.string :name
      t.timestamps
    end

    create_table :order_requests do |t|
      t.integer :restaurant_id
      t.integer :order_status_id
      t.datetime :date
      t.timestamps
    end

    create_table :order_statuses do |t|
      t.string :name
      t.timestamps
    end

    create_table :user_orders do |t|
      t.integer :user_id
      t.integer :order_request_id
      t.integer :user_order_status_id
      t.string :order
      t.timestamps
    end

    create_table :user_order_statuses do |t|
      t.string :name
      t.timestamps
    end

  end
end
