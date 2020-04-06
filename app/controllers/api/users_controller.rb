class Api::UsersController < ApplicationController

  def index
    render json: Users::Builder.new.build_index
  end

  def show
    render json: Users::Builder.new.build_show(params[:id])
  end

end