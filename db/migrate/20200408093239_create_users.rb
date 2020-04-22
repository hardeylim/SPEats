class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birth_date
      t.integer :role_id
      t.integer :active_position_id 
      t.string :google_token
      t.string :google_refresh_token
      t.timestamps
    end
  end
end
