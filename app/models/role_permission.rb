class RolePermission < ApplicationRecord

  belongs_to :role
  has_many :permissions

end
