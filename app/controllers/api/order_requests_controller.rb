class Api::OrderRequestsController < ApplicationController

  def index
    @service = OrderRequests::Builder.new
    render json: @service.build_index
  end

  def create
    @service = OrderRequests::Adder.new
    render json: @service.add(order_request_parameters)
  end

  def show
    render json: Users::Builder.new.build_show(params[:id])
  end


  def order_request_parameters
    # Adding permit requires an outer object that encloses parms
    #
    # params.permit(:orderRequest).permit(:restaurant_id)
    # {
    #   "orderRequest" : {
    #     "restaurant_id" : 1
    #   }
    # }
    #
    # whilst removing it just makes the required params
    # {
    #   "restaurant_id" : 1
    # }

    params.require(:orderRequest)
        .permit(
        :restaurant_id,
        :date,
        :deadline
    )
  end

end
