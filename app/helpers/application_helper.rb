module ApplicationHelper

  def cart_path
    if signed_in?
      new_order_path
    else
      wishlist_index_path
    end
  end

  def number_of_items_in_cart
    if current_user.present?
      order_items = OrderItem.
        where("user_id = ?", current_user.id).
        where("order_id is ?", nil)
      order_items.sum(&:quantity)
    else 
      if session[:wishlist].present?
        session[:wishlist].size
      else
        0
      end
    end
  end

end
