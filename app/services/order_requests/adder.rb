class OrderRequests::Adder < BaseService

  OPEN_STATUS = 3

  def add(permitted_order_request)
    OrderRequest.transaction do
      permitted_order_request.merge!(order_status_id: OPEN_STATUS)
      @order_request = OrderRequest.new(permitted_order_request)
      @order_request.save
    end
  end

  #  TODO: validation
  private
  def validate_order_request
  #  validate date and time must be after dateTime(now)
  #  validate fields
  end



end
