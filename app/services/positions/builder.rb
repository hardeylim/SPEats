class Positions::Builder

  def build_positions user
    positions = []
    user_positions.positions.each do |position|
      positions.push(comment_details(comment))
    end
    comments
  end

  def position_details position
    position.attributes.merge({
      positions: user.user_positions.position.position_name
    })
  end

end