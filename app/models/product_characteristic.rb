class ProductCharacteristic < ApplicationRecord
  belongs_to :product
  belongs_to :characteristic
end
