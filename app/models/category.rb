class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  validates :name, uniqueness: true, presence:true
end
