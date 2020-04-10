class OrderRequests::Builder
  def initialize
    @order_requests = []
  end

  def build_index
    OrderRequest.all
  end

  def build_order_request_details(order_request) {
        date: order_request.date,
        restaurant_name: order_request.restaurant.name,
        status: order_request.order_status.name,
        orders_submitted: compute_for_orders_submitted(order_request)
    }
  end

  def compute_for_orders_submitted(order_request)

  end
end
