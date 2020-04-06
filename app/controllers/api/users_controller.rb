class Api::UsersController < ApplicationController

  def index
    render json: Users::Builder.new.build_index
  end

end