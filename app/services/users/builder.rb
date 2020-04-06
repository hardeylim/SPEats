class Users::Builder

  def initialize
    @users = []
  end

  def build_index
    User.all.each do |user|
      @users.push(build_user_details(user))
    end
    @users
  end

  def build_show(user_id)
    @user = User.find(user_id)
    build_user_details(@user)
  end

  def build_user_details(user)
    {
        id: user.id,
        fistName: user.first_name,
        lastName: user.last_name,
        email: user.email,
        position: user.position_title.name,
        permission: user.role.name
    }
  end

end
