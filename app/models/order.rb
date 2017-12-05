class Order < ApplicationRecord
  belongs_to :address

  has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :order_items, :allow_destroy => true

  validates :address_id, presence: true

  def order_items_attributes=(attributes)
    attributes.each do |attribute|
      self.order_items << OrderItem.find(attribute[1]['id'])
    end
    assign_nested_attributes_for_collection_association(:order_items, attributes)
  end

  def total_price
    order_items.map{|item| item.total_price}.sum
  end

  def pretty_created_at
    created_at.strftime("%m/%d/%Y")
  end
end
