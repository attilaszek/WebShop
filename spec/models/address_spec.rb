require 'rails_helper'

RSpec.describe Address, type: :model do

  describe "validate_phone_number" do
    context "Phone number too short" do
      it "fails validation" do 
        address = Address.create(:phone_number => "073655725")
        address.valid?
        expect(address.errors[:phone_number]).to include("Invalid phone number")
      end
    end

    context "Phone number too long" do
      it "fails validation" do 
        address = Address.create(:phone_number => "07365545725")
        address.valid?
        expect(address.errors[:phone_number]).to include("Invalid phone number")
      end
    end

    context "Phone number contains a letter" do
      it "fails validation" do 
        address = Address.create(:phone_number => "073655a725")
        address.valid?
        expect(address.errors[:phone_number]).to include("Invalid phone number")
      end
    end

    context "Phone number is valid" do
      it "passes validation" do 
        address = Address.create(:phone_number => "0736553725")
        address.valid?
        expect(address.errors[:phone_number]).not_to include("Invalid phone number")
      end
    end
  end

end
