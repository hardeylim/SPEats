class Restaurants::Builder

  def initialize
    @restaurants = []
  end

  def build_index
    Restaurant.all.each do |restaurant|
      @restaurants.push(build_restaurant_details(restaurant))
    end
    @restaurants
  end

  # def build_show(user_id)
  #   @user = User.find(user_id)
  #   build_user_details(@user)
  # end

  def build_restaurant_details(restaurant)
    {
        id: restaurant.id,
        name: restaurant.name,
        phoneNumber: restaurant.phone_number,
        whereToOrder: build_delivery_details(restaurant.deliveries)
    }
  end

  def build_delivery_details(deliveries)
    @deliveries = []
    deliveries.each do |delivery|
      @deliveries.push(delivery.name)
    end
    @deliveries
  end

end
