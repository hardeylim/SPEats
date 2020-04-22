class Users::Builder

  def initialize
    @users = []
    @position_builder = Positions::Builder.new
  end

  def build_index
    User.includes(role: :role_permissions, user_positions: :position).each do |user|
      @users.push(build_user_details(user))
    end
    @users
  end

  def build_user_details user
    {
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      title: user.position.position_name,
      permission: user.role.role_name
    }
  end

end