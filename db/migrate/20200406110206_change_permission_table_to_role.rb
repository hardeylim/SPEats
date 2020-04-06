class ChangePermissionTableToRole < ActiveRecord::Migration[6.0]
  def change
    rename_table :permissions, :roles
  end
end
