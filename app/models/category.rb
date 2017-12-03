class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  validates :name, uniqueness: true, presence:true
  accepts_nested_attributes_for :sub_categories, allow_destroy: true

  delegate :each, :to => :sub_categories, :prefix => true
end
