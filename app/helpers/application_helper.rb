module ApplicationHelper

  def number_of_items_in_cart
    if current_user.present?
      order_items = OrderItem.
        where("user_id = ?", current_user.id).
        where("order_id is ?", nil)
      order_items.sum(&:quantity)
    else 
      0
    end
  end

end
