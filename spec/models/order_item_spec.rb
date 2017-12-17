require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  describe "total_price" do
    it "calculates total price of order item" do
      order_item = OrderItem.create(:price => 123.2, :quantity => 5)
      expect(order_item.total_price).to eq(616.0)
    end
  end

end
