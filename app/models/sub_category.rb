class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy
  has_many :characteristics, dependent: :destroy
  validates :name, uniqueness: true, presence:true
end
