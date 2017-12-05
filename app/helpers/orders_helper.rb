module OrdersHelper
  def order_state(order)
    if order.completed
      "Completed"
    else
      "Under processing..."
    end
  end
end
