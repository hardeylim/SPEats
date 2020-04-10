class Api::OrderRequestsController < ApplicationController

  def index
    @service = OrderRequests::Builder.new
    render json: @service.build_index
  end

  def show
    render json: Users::Builder.new.build_show(params[:id])
  end

end