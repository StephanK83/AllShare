class Item < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user
  has_many_attached :photos

  validates :picture, :category, :name, :description, :postal_code, :quantity, :min_days_rent, :price, presence: true

  acts_as_favoritable

  include PgSearch::Model

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
