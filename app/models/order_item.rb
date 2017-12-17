class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :user
  delegate :real_price, :name, :to => :product, :prefix => true

  validates :quantity, numericality: { only_integer: true }

  def self.find_unconfirmed_by_product_and_user(product_id, user_id)
    self.where("product_id = ?", product_id).
        where("user_id = ?", user_id).
        where("order_id is ?", nil).
        first
  end

  def self.create_or_update(product_id, user_id)
    order_item = self.find_unconfirmed_by_product_and_user(product_id, user_id)
    if order_item.blank?
      order_item = self.new(
          user_id: user_id,
          product_id: product_id,
          quantity: 1)
    else
      order_item.quantity += 1
    end
    order_item
  end

  def total_price
    price * quantity
  end
end
