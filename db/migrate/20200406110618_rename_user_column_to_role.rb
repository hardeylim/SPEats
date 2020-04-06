class RenameUserColumnToRole < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :permission_id, :role_id
  end
end
