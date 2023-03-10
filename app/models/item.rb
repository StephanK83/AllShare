class Item < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :category, :name, :description, :postal_code, :quantity, :min_days_rent, :price, presence: true
end
