class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
  validates :name, uniqueness: true, presence:true
end
