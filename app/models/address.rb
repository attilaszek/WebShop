class Address < ApplicationRecord
  belongs_to :user

  validates :country, presence: true
  validates :county, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validate :validate_phone_number

  private
    def validate_phone_number
      if phone_number.present?
        unless phone_number.size == 10 and /\d{10}/.match(phone_number)
          errors.add(:phone_number, "Invalid phone number")
        end
      end
    end
end
