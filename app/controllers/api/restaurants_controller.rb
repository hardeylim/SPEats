class Api::RestaurantsController < ApplicationController

  def index
    render json: Restaurants::Builder.new.build_index
  end

end

