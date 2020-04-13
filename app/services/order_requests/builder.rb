class OrderRequests::Builder
  def initialize
    @order_requests = []
  end

  def build_index
    OrderRequest.all.each do |order_request|
      @order_requests.push(build_order_request_details(order_request))
    end
    @order_requests
  end

  def build_order_request_details(order_request) {
        date: order_request.date,
        restaurant_name: order_request.restaurant.name,
        status: order_request.order_status.name,
        orders_submitted: compute_for_orders_submitted(order_request)
    }
  end

  def compute_for_orders_submitted(order_request)
    '40/40'
  end
end
