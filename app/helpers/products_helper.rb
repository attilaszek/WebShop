module ProductsHelper

  def selected_value(params, searchable_characteristic)
    params["#{searchable_characteristic.id.to_s}"] if params.present?
  end

  def add_to_cart_button(product_id, tag='span')
    button_text = "<#{tag}>Add to cart <span class=\"glyphicon glyphicon-shopping-cart\"></span></#{tag}>".html_safe

    if signed_in?
      link_to button_text,
          order_items_path(order_item: {product_id: product_id}),
          method: "post",
          class: "a btn btn-default"
    else
      link_to button_text,
          wishlist_new_path(product_id: product_id),
          class: "a btn btn-default"
    end
  end
end
