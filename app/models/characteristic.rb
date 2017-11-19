class Characteristic < ApplicationRecord
  belongs_to :sub_category
  has_many :product_characteristics, dependent: :destroy

  validates :name, presence:true
end
