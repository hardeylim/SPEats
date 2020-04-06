class Users::Builder

  def initialize
    @users = []
  end

  def build_index
    User.all
  end

end
