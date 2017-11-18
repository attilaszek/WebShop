class Product < ApplicationRecord
  belongs_to :sub_category
  validates :name, uniqueness: true, presence:true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validate :validate_promotion_price

  private
    def validate_promotion_price
      if promotion_price.present?
        errors.add(:promotion_price, "Invalid promotion price") if promotion_price > price
      end
    end
end
