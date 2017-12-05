class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.find_unconfirmed_by_product_and_user(product_id, user_id)
    self.where("product_id = ?", product_id).
        where("user_id = ?", user_id).
        where("order_id is ?", nil).
        first
  end

  def total_price
    price * quantity
  end
end
