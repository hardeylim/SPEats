class User < ApplicationRecord
 
  has_many :user_positions
  belongs_to :position, class_name: 'Position', foreign_key: :active_position_id
  belongs_to :role, class_name: 'Role', foreign_key: :role_id
  has_many :sessions
  
  #validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  #validates :email, uniqueness: true  
  	  
end






