require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe ".validate_promotion_price" do
    context "promotion price larger than normal price" do
      it "returns false" do
        product = Product.create(:price => 1000.23, :promotion_price => 1234)
        product.valid?
        expect(product.errors[:promotion_price]).to include("Invalid promotion price")
      end
    end
    context "real promotion price" do
      it "returns true" do
        product = Product.create(:price => 1000.23, :promotion_price => 912.5)
        product.valid?
        expect(product.errors[:promotion_price]).not_to include("Invalid promotion price")
      end
    end
  end

  context "price less than or equal to 0" do
    it "fails validation" do
      product = Product.create(:price => -0.5)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 0")
    end
  end
  context "real price" do
    it "pass validation" do
      product = Product.create(:price => 0.5)
      product.valid?
      expect(product.errors[:price]).not_to include("must be greater than or equal to 0")
    end
  end
end
