class Item < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user
  has_many_attached :photos

  validates :category, :name, :description, :postal_code, :quantity, :min_days_rent, :price, presence: true

  geocoded_by :postal_code
  after_validation :geocode, if:
  :will_save_change_to_postal_code?

  acts_as_favoritable

  include PgSearch::Model

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true }
    }
end

#
#validates :picture, :category, :name, :description, :postal_code, :quantity, :min_days_rent, :price, presence: true
#when I add the picture validation I can't create a new Item from the List an item page
#when I add the photos validation I can't seed
# Explanation
